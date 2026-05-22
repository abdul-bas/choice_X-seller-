import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/state/bloc/auth/authBoloc.dart';
import 'package:choice_x_seller/state/bloc/auth/states/auth_state.dart';
import 'package:choice_x_seller/state/bloc/auth/states/log_out_state.dart';
import 'package:choice_x_seller/screen/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget authLogoutListener({required Widget child}) {
  return BlocListener<AuthBloc, AuthState>(
    listener: (context, state) {
      if (state is AuthLogOutSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.message),
            backgroundColor: AppColors.success,
          ),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => WelcomeScreen()),
          (route) => false,
        );
      }

      if (state is AuthFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.error),
            backgroundColor: AppColors.danger,
          ),
        );
      }
    },
    child: child,
  );
}
