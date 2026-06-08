import 'package:choice_x_seller/models/seller_model.dart/seller_model.dart';


abstract class AuthEvent {}

class AuthSellerRegister extends AuthEvent {
  final SellerModel model;
  
  AuthSellerRegister({ required this.model});
}

class AuthSellerAccess extends AuthEvent {
  final String email;
  final String password;
 
  AuthSellerAccess({
    required this.email,
    required this.password,
  
  });
}

class AuthUpdatePassword extends AuthEvent {
  final String email;
  
  AuthUpdatePassword({ required this.email});
}
 class AuthVerifySeller extends AuthEvent{
  
 }

