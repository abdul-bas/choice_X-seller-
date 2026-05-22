

import 'package:choice_x_seller/state/bloc/auth/states/auth_state.dart';

class AuthUpdatePasswordSuccess extends AuthState {}
class AuthUpdatePasswordFailure extends AuthState {
  final String message;
  AuthUpdatePasswordFailure(this.message);
}