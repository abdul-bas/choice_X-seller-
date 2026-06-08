import 'package:flutter/material.dart';

abstract class AuthState {}

class AuthError extends AuthState {
  final String title;
  final String message;
  final IconData icon;
  final Color iconColor;
  final String buttonText;
  bool? pop;
  Widget? removeAllUntil;
  Widget? replace;
  Widget? popUntil;

  AuthError(
      {required this.title,
      required this.message,
      required this.icon,
      required this.iconColor,
      required this.buttonText,
      this.pop,
      this.popUntil,
      this.removeAllUntil,
      this.replace});
}

class AuthSellerNotFound extends AuthState {
  final String title;
  final String message;
  final IconData icon;
  final Color iconColor;
  final String buttonText;
  bool? pop;
  Widget? removeAllUntil;
  Widget? replace;
  Widget? popUntil;
  AuthSellerNotFound(
      {required this.title,
      required this.message,
      required this.icon,
      required this.iconColor,
      required this.buttonText,
      this.pop,
      this.popUntil,
      this.removeAllUntil,
      this.replace});
}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String title;
  final String message;
  final IconData icon;
  final Color iconColor;
  final String buttonText;
  bool? pop;
  Widget? popUntil;
  Widget? removeAllUntil;
  Widget? replace;
  AuthSuccess(
      {required this.title,
      required this.message,
      required this.icon,
      this.popUntil,
      required this.iconColor,
      required this.buttonText,
      this.pop,
      this.removeAllUntil,
      this.replace});
}

class AuthPending extends AuthState {
  final String title;
  final String message;
  final IconData icon;
  final Color iconColor;
  final String buttonText;
  bool? pop;
  Widget? popUntil;
  Widget? removeAllUntil;
  Widget? replace;

  AuthPending(
      {required this.title,
      required this.message,
      required this.icon,
      this.popUntil,
      required this.iconColor,
      required this.buttonText,
      this.pop,
      this.removeAllUntil,
      this.replace});
}

class AuthAccept extends AuthState {
  final String title;
  final String message;
  final IconData icon;
  final Color iconColor;
  final String buttonText;
  bool? pop;
  Widget? popUntil;
  Widget? removeAllUntil;
  Widget? replace;

  AuthAccept(
      {required this.title,
      required this.message,
      required this.icon,
      this.popUntil,
      required this.iconColor,
      required this.buttonText,
      this.pop,
      this.removeAllUntil,
      this.replace});
}

class AuthReject extends AuthState {
  final String title;
  final String message;
  final IconData icon;
  final Color iconColor;
  final String buttonText;
  bool? pop;
  Widget? popUntil;
  Widget? removeAllUntil;
  Widget? replace;

  AuthReject(
      {required this.title,
      required this.message,
      required this.icon,
      required this.iconColor,
      required this.buttonText,
      this.pop,
      this.popUntil,
      this.removeAllUntil,
      this.replace});
}
