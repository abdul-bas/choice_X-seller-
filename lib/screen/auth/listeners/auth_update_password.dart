import 'package:choice_x_seller/screen/auth/dialog/forgot_password.dart';
import 'package:choice_x_seller/state/bloc/auth/authBoloc.dart';
import 'package:choice_x_seller/state/bloc/auth/states/auth_state.dart';
import 'package:choice_x_seller/state/bloc/auth/states/update_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget authUpdatePasswordListener({
  required BuildContext context,
  required Widget child,
}) {
  return BlocListener<AuthBloc, AuthState>(
    listener: (context, state) {
      if (state is AuthUpdatePasswordSuccess) {
        showSuccessDialog(context);
      }

      if (state is AuthUpdatePasswordFailure) {
        Get.snackbar(
          'Error',
          state.message,
        );
      }
    },
    child: child,
  );
}