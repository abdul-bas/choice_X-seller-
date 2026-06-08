

import 'package:choice_x_seller/repository/auth_repository/repository.dart';
import 'package:choice_x_seller/state/bloc/auth/events/auth_event.dart';
import 'package:choice_x_seller/state/bloc/auth/events/log_out_events.dart';
import 'package:choice_x_seller/state/bloc/auth/states/auth_initial.dart';
import 'package:choice_x_seller/state/bloc/auth/states/auth_state.dart';
import 'package:choice_x_seller/state/bloc/auth/states/log_out_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository repository = AuthRepository();
  AuthBloc() : super(AuthInitial()) {
    on<AuthSellerRegister>((event, emit) async {
      emit(AuthLoading() );
      final resulte = await repository.sellerRegister(model: event.model);
      emit(resulte);
    });
    on<AuthSellerAccess>((event, emit) async {
       emit(AuthLoading());
      final resulte = await repository.sellerAccess(email: event.email, password: event.password);
      emit(resulte);
    });
    on<AuthUpdatePassword>((event, emit) async {
       emit(AuthLoading());
      final resulte = await repository.updatePassword(
          email:event.email );
      emit(resulte);
    });
    on<AuthVerifySeller>((event, emit) async {
       emit(AuthLoading());
      final resulte = await repository.verifySeller();
      emit(resulte);
    });
    on<AuthLogOutRequested>((event, emit) async {
       emit(AuthLogOutLoading());
      final resulte = await repository.logOut();
      emit(resulte);
    });
  }
}
