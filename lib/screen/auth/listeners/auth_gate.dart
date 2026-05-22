
import 'package:choice_x_seller/layout/dash_board.dart';
import 'package:choice_x_seller/state/bloc/auth/authBoloc.dart';
import 'package:choice_x_seller/state/bloc/auth/states/auth_state.dart';
import 'package:choice_x_seller/screen/auth/seller_verification_status/pending_screen.dart';
import 'package:choice_x_seller/screen/auth/seller_verification_status/reject_screen.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/common/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget authGate({required Widget child}) {
  return BlocConsumer<AuthBloc, AuthState>(
    listener: (context, state) {
      if (state is AuthPending) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const PendingScreen()),
          (_) => false,
        );
      } else if (state is AuthReject) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const RejectedScreen()),
          (_) => false,
        );
      } else if (state is AuthAccept) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => SellerMainLayout()),
          (_) => false,
        );
      } else if (state is AuthError) {
        showDialog(
          context: context,
          builder: (_) => DialogWidget(state: state),
        );
      }
    },
    builder: (context, state) {
      return Stack(
        children: [
          child,
          if (state is AuthLoading)
            const Positioned.fill(
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      );
    },
  );
}