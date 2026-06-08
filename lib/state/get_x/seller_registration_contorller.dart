import 'package:choice_x_seller/models/seller_model.dart/seller_model.dart';
import 'package:choice_x_seller/state/bloc/auth/authBoloc.dart';
import 'package:choice_x_seller/state/bloc/auth/events/auth_event.dart';
import 'package:choice_x_seller/core/constants/seller_registration_steps.dart';
import 'package:choice_x_seller/state/ui_state/seller_registration/drop_down_state.dart';
import 'package:choice_x_seller/state/ui_state/seller_registration/field_state.dart';
import 'package:choice_x_seller/state/ui_state/seller_registration/password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SellerRegCtrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  int step = 0;
  late final GlobalKey<FormState> formKey;
  late final PageController page;
  late final AnimationController _anim;
  late final Animation<Offset> slideAnim;
  late final Animation<double> fadeAnim;

  final ownerName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final bizType = TextEditingController();
  final dob = TextEditingController();
  final street = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController(text: 'India');
  final zip = TextEditingController();
  final regPhone = TextEditingController();
  final landmark = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPass = TextEditingController();

  final Map<String, FieldState> fieldStates = {};
  final Map<String, PasswordState> pwdStates = {};
  final Map<String, DropDownState> dropStates = {};

  bool nextBtnDown = false;

  FieldState fieldState(String id) =>
      fieldStates.putIfAbsent(id, FieldState.new);
  PasswordState pwdState(String id) =>
      pwdStates.putIfAbsent(id, PasswordState.new);
  DropDownState dropState(String id, String? initial) =>
      dropStates.putIfAbsent(id, () => DropDownState(initial));

  void setFocus(String id, bool focused) {
    fieldState(id).focused = focused;
    update(['field_$id']);
  }

  void setPwdFocus(String id, bool focused) {
    pwdState(id).focused = focused;
    update(['pwd_$id']);
  }

  void togglePwdVisibility(String id) {
    pwdState(id).hidden = !pwdState(id).hidden;
    update(['pwd_$id']);
  }

  void setDropValue(String id, String? val, TextEditingController ctrl) {
    dropState(id, null).value = val;
    ctrl.text = val ?? '';
    update(['drop_$id']);
  }

  void setNextBtnDown(bool v) {
    nextBtnDown = v;
    update(['next_btn']);
  }

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    page = PageController();

    _anim = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 420));
    slideAnim = Tween<Offset>(begin: const Offset(0.06, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _anim, curve: Curves.easeOutCubic));
    fadeAnim = CurvedAnimation(parent: _anim, curve: Curves.easeOut);

    _anim.forward();
  }

  @override
  void onClose() {
    page.dispose();
    _anim.dispose();

    [
      ownerName,
      email,
      phone,
      bizType,
      dob,
      street,
      city,
      state,
      country,
      zip,
      regPhone,
      landmark,
      username,
      password,
      confirmPass
    ].forEach((c) => c.dispose());

    super.onClose();
  }

  void _replay() {
    _anim.reset();
    _anim.forward();
  }

  void goTo(int i) {
    _replay();
    step = i;
    update();
    page.animateToPage(i,
        duration: const Duration(milliseconds: 420),
        curve: Curves.easeInOutCubic);
  }

  void next() {
    if (!formKey.currentState!.validate()) return;
    if (step < sellerRegistrationSteps.length - 1) goTo(step + 1);
  }

  void back() {
    if (step > 0) goTo(step - 1);
  }

  bool validateBasic() =>
      ownerName.text.isNotEmpty &&
      email.text.isNotEmpty &&
      phone.text.isNotEmpty &&
      bizType.text.isNotEmpty &&
      dob.text.isNotEmpty;

  bool validateAddress() =>
      street.text.isNotEmpty &&
      city.text.isNotEmpty &&
      state.text.isNotEmpty &&
      country.text.isNotEmpty &&
      zip.text.isNotEmpty &&
      regPhone.text.isNotEmpty;

  bool validateAccount() =>
      username.text.isNotEmpty &&
      password.text.isNotEmpty &&
      confirmPass.text.isNotEmpty &&
      password.text == confirmPass.text;

  Map<String, String? Function(String?)> get basicValidators => {
        'ownerName': (v) =>
            (v == null || v.trim().isEmpty) ? "Owner name is required" : null,
        'email': (v) =>
            (v == null || v.trim().isEmpty) ? "Email is required" : null,
        'phone': (v) =>
            (v == null || v.trim().isEmpty) ? "Phone is required" : null,
        'bizType': (v) =>
            (v == null || v.trim().isEmpty) ? "Select business type" : null,
        'dob': (v) => (v == null || v.trim().isEmpty)
            ? "Date of birth is required"
            : null,
      };

  Map<String, String? Function(String?)> get addressValidators => {
        'street': (v) =>
            (v == null || v.trim().isEmpty) ? "Street required" : null,
        'city': (v) => (v == null || v.trim().isEmpty) ? "City required" : null,
        'state': (v) => (v == null || v.trim().isEmpty) ? "Select state" : null,
        'country': (v) =>
            (v == null || v.trim().isEmpty) ? "Select country" : null,
        'zip': (v) {
          if (v == null || v.trim().isEmpty) return "Zip required";
          if (v.length != 6) return "Enter valid pincode";
          return null;
        },
        'regPhone': (v) {
          if (v == null || v.trim().isEmpty) return "Phone required";
          if (v.length < 10) return "Enter valid phone number";
          return null;
        },
      };

  Map<String, String? Function(String?)> get accountValidators => {
        'username': (v) {
          if (v == null || v.trim().isEmpty) return "Username is required";
          if (v.length < 4) return "Username must be at least 4 characters";
          return null;
        },
        'password': (v) {
          if (v == null || v.isEmpty) return "Password is required";
          if (v.length < 8) return "Password must be at least 8 characters";
          return null;
        },
        'confirmPass': (v) {
          if (v == null || v.isEmpty) return "Confirm your password";
          if (v != password.text) return "Passwords do not match";
          return null;
        },
      };

  void registerSeller(BuildContext context)  {
  if (!formKey.currentState!.validate()) {
    Get.snackbar(
      'Error',
      'Please fill all required fields correctly',
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    return;
  }

 
  if (!validateBasic()) {
    Get.snackbar('Error', 'Please fill basic info correctly');
    return;
  }
  if (!validateAddress()) {
    Get.snackbar('Error', 'Please fill address info correctly');
    return;
  }
  if (!validateAccount()) {
    Get.snackbar('Error', 'Please fill account info correctly');
    return;
  }

  try {
   
    final sellerModel = SellerModel(
      ownerName: ownerName.text.trim(),
      email: email.text.trim(),
      phoneNumber: phone.text.trim(),
      businessType: bizType.text.trim(),
      dateOfBirth: dob.text.trim(),
      street: street.text.trim(),
      city: city.text.trim(),
      state: state.text.trim(),
      country: country.text.trim(),
      zipCode: zip.text.trim(),
      regPhoneNumber: regPhone.text.trim(),
      landMark: landmark.text.trim(),
      userName: username.text.trim(),
      password: password.text,
      status: 'active', // or default status
    );

    
    context.read<AuthBloc>().add(AuthSellerRegister(model: sellerModel));

    

    Get.snackbar(
      'Success',
      'Seller registered successfully',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    formKey.currentState!.reset();
    ownerName.clear();
    email.clear();
    phone.clear();
    bizType.clear();
    dob.clear();
    street.clear();
    city.clear();
    state.clear();
    country.text = 'India';
    zip.clear();
    regPhone.clear();
    landmark.clear();
    username.clear();
    password.clear();
    confirmPass.clear();
  } catch (e) {
    Get.snackbar(
      'Error',
      'Failed to register seller: $e',
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
}
