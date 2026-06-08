
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/state/bloc/auth/authBoloc.dart';
import 'package:choice_x_seller/state/bloc/auth/events/log_out_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogOutController {

static void submitLogout(BuildContext context) {
  Navigator.pop(context);
  context.read<AuthBloc>().add(AuthLogOutRequested());
}
static LinearGradient logoutDialogGradient() {
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.chatBubbleReceiverAlt,
      AppColors.sellerBg,
    ],
  );
}
}