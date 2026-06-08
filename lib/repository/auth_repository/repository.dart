import 'package:choice_x_seller/core/constants/app_color.dart';
import 'package:choice_x_seller/models/seller_model.dart/seller_model.dart';
import 'package:choice_x_seller/screen/auth/seller_access/seller_access_Page.dart';
import 'package:choice_x_seller/layout/dash_board.dart';
import 'package:choice_x_seller/screen/welcome_screen/welcome_screen.dart';
import 'package:choice_x_seller/screen/auth/seller_verification_status/pending_screen.dart';
import 'package:choice_x_seller/screen/auth/seller_verification_status/reject_screen.dart';
import 'package:choice_x_seller/state/bloc/auth/states/auth_state.dart';
import 'package:choice_x_seller/state/bloc/auth/states/log_out_state.dart';
import 'package:choice_x_seller/state/bloc/auth/states/update_password.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AuthState> verifySeller() async {
    try {
      User? seller = _auth.currentUser;

      if (seller == null) {
        return AuthSellerNotFound(
            title: "Not Logged In",
            message: "Please login to continue.",
            icon: Icons.warning_amber_rounded,
            iconColor: primery,
            buttonText: "Go to Login",
            popUntil: SellerAuthPage());
      }

      final sellerDoc =
          await _firestore.collection('seller').doc(seller.uid).get();

      if (!sellerDoc.exists) {
        return AuthError(
          title: "No Data Found",
          message: "Seller record not found. Please register again.",
          icon: Icons.error_outline,
          iconColor: Colors.red,
          buttonText: "Register",
        );
      }

      final status = sellerDoc['status'];
      if (status == 'pending') {
        return AuthPending(
          title: "Account Under Review",
          message:
              "Your registration is under review. Please wait for admin approval.",
          icon: Icons.hourglass_top,
          iconColor: primery,
          buttonText: "Refresh",
        );
      } else if (status == 'reject') {
        return AuthReject(
          title: "Registration Rejected",
          message:
              "Your application has been rejected. Please contact support or reapply.",
          icon: Icons.cancel,
          iconColor: Colors.red,
          buttonText: "Try Again",
        );
      } else if (status == 'approved') {
        return AuthAccept(
          title: "Access Granted",
          message: "Welcome! Your account has been approved.",
          icon: Icons.check_circle,
          iconColor: Colors.green,
          buttonText: "Go to Dashboard",
          removeAllUntil: SellerMainLayout(),
        );
      } else {
        return AuthError(
          title: "Invalid Status",
          message:
              "Your account has an unknown status. Please contact support.",
          icon: Icons.help_outline,
          iconColor: Colors.grey,
          buttonText: "Contact Support",
        );
      }
    } catch (e) {
      return AuthError(
        title: "Verification Failed",
        message: "Something went wrong: $e",
        icon: Icons.error,
        iconColor: Colors.red,
        buttonText: "Retry",
      );
    }
  }

  Future<dynamic> sellerRegister({required SellerModel model}) async {
    try {
      UserCredential sellerCredential =
          await _auth.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      User? seller = sellerCredential.user;
      if (seller == null) {
        return AuthError(
            title: "Registration Failed",
            message: "Unable to create user.",
            icon: Icons.error,
            iconColor: Colors.red,
            buttonText: "Retry",
            replace: WelcomeScreen());
      }
      final sellerWithUid = SellerModel(
        email: model.email,
        ownerName: model.ownerName,
        businessType: model.businessType,
        dateOfBirth: model.dateOfBirth,
        regPhoneNumber: model.regPhoneNumber,
        street: model.street,
        phoneNumber: model.phoneNumber,
        city: model.city,
        state: model.state,
        country: model.country,
        zipCode: model.zipCode,
        landMark: model.landMark,
        userName: model.userName,
        password: model.password,
        status: 'pending',
        uid: seller.uid,
      );

      await _firestore
          .collection('seller')
          .doc(seller.uid)
          .set(sellerWithUid.toMap(sellerWithUid));

      if (!seller.emailVerified) {
        await seller.sendEmailVerification();
      }
      final doc = await _firestore.collection('seller').doc(seller.uid).get();
      final status = doc['status'];
      if (status == 'approved') {
        return AuthAccept(
            title: "Access Granted",
            message: "Welcome back! Your seller account is approved.",
            icon: Icons.check_circle,
            iconColor: Colors.green,
            buttonText: "Continue",
            removeAllUntil: SellerMainLayout());
      } else if (status == 'pending') {
        return AuthPending(
            title: "Pending Approval",
            message: "Your request is still under review. Please wait.",
            icon: Icons.pending_actions,
            iconColor: primery,
            buttonText: "OK",
            replace: PendingScreen());
      } else if (status == 'reject') {
        return AuthReject(
            title: "Access Rejected",
            message: "Your seller registration was rejected.",
            icon: Icons.cancel,
            iconColor: Colors.red,
            buttonText: "OK",
            replace: RejectedScreen());
      }

      return AuthSuccess(
          title: "Success",
          message: "Seller registered successfully! Please verify your email.",
          icon: Icons.check_circle,
          iconColor: Colors.green,
          buttonText: "OK",
          removeAllUntil: SellerMainLayout());
    } on FirebaseAuthException catch (e) {
      return AuthError(
          title: "Error",
          message: e.message ?? "Authentication error",
          icon: Icons.error,
          iconColor: Colors.red,
          buttonText: "Retry",
          replace: WelcomeScreen());
    } catch (e) {
      return AuthError(
          title: "Error",
          message: "Unexpected error occurred",
          icon: Icons.error,
          iconColor: Colors.red,
          buttonText: "Retry",
          replace: WelcomeScreen());
    }
  }

  Future<dynamic> sellerAccess({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? seller = userCred.user;

      if (seller == null) {
        return AuthError(
            title: "Login Failed",
            message: "User not found. Please register first",
            icon: Icons.error,
            iconColor: Colors.red,
            buttonText: "OK",
            replace: WelcomeScreen());
      }

      if (!seller.emailVerified) {
        return AuthError(
            title: "Email Not Verified",
            message: "Please verify your email before logging in.",
            icon: Icons.email_outlined,
            iconColor: brandColor,
            buttonText: "Resend Email",
            replace: WelcomeScreen());
      }

      final doc = await _firestore.collection('seller').doc(seller.uid).get();
      if (!doc.exists) {
        return AuthError(
            title: "Access Denied",
            message: "Seller data not found in database.",
            icon: Icons.warning,
            iconColor: Colors.red,
            buttonText: "OK",
            replace: WelcomeScreen());
      }

      final status = doc['status'];
      if (status == 'approved') {
        return AuthAccept(
            title: "Access Granted",
            message: "Welcome back! Your seller account is approved.",
            icon: Icons.check_circle,
            iconColor: Colors.green,
            buttonText: "Continue",
            removeAllUntil: SellerMainLayout());
      } else if (status == 'pending') {
        return AuthPending(
            title: "Pending Approval",
            message: "Your request is still under review. Please wait.",
            icon: Icons.pending_actions,
            iconColor: primery,
            buttonText: "OK",
            replace: PendingScreen());
      } else if (status == 'reject') {
        return AuthReject(
            title: "Access Rejected",
            message: "Your seller registration was rejected.",
            icon: Icons.cancel,
            iconColor: Colors.red,
            buttonText: "OK",
            replace: RejectedScreen());
      } else {
        return AuthError(
            title: "Unknown Status",
            message: "Unexpected account status found.",
            icon: Icons.help,
            iconColor: Colors.grey,
            buttonText: "OK",
            replace: WelcomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      return AuthError(
          title: "Login Error",
          message: e.message ?? "Authentication failed",
          icon: Icons.error,
          iconColor: Colors.red,
          buttonText: "Retry",
          replace: WelcomeScreen());
    } catch (e) {
      return AuthError(
          title: "Unexpected Error",
          message: "Something went wrong. Please try again.",
          icon: Icons.error_outline,
          iconColor: Colors.red,
          buttonText: "OK",
          replace: WelcomeScreen());
    }
  }

  Future<dynamic> updatePassword({
    required String email,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);

      return AuthUpdatePasswordSuccess(
         );
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      switch (e.code) {
        case 'invalid-email':
          errorMessage = "The email address is not valid.";
          break;
        case 'user-not-found':
          errorMessage = "No account found for this email.";
          break;
        case 'missing-email':
          errorMessage = "Please enter an email address.";
          break;
        default:
          errorMessage = "An unknown Firebase error occurred.";
      }

      return AuthUpdatePasswordFailure(
           "Reset Failed",
       );
    } catch (e) {
      return AuthUpdatePasswordFailure(
         
         "Something went wrong. Please try again later.",
        );
    }
  }

  String sellerId() {
    final seller = _auth.currentUser;
    if (seller != null) {
      return seller.uid;
    } else {
      return '';
    }
  }

  sellerStatus() {
    final seller = _auth.currentUser;
    if (seller != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<AuthState> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return AuthLogOutSuccess("Logged out successfully");
    } catch (e) {
      return AuthFailure(e.toString());
    }
  }

  Stream<bool> listenUserOnlineStatus(String uid) {
    final ref = FirebaseDatabase.instance.ref('status/$uid/online');

    return ref.onValue.map((event) {
      if (!event.snapshot.exists) return false;

      final value = event.snapshot.value;
      print('dkkdjkdk  $value');
      return value == true;
    });
  }
}
