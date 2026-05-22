


import 'package:choice_x_seller/state/bloc/auth/states/auth_state.dart';

class AuthLogOutLoading extends AuthState {}

class AuthLogOutSuccess extends AuthState {
  final String message;
  AuthLogOutSuccess(this.message);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}
