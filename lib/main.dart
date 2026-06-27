import 'package:choice_x_seller/firebase_options.dart';
import 'package:choice_x_seller/state/bloc/chat/chat_bloc.dart';
import 'package:choice_x_seller/state/get_x/arc_progress_controller.dart';
import 'package:choice_x_seller/state/get_x/audio_preview_controller.dart';
import 'package:choice_x_seller/state/get_x/message_list_controller.dart';
import 'package:choice_x_seller/state/get_x/order_stat_controller.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/state/get_x/seller_order_controller.dart';
import 'package:choice_x_seller/state/get_x/seller_registration_contorller.dart';
import 'package:choice_x_seller/screen/welcome_screen/welcome_screen.dart';
import 'package:choice_x_seller/state/bloc/auth/authBoloc.dart';
import 'package:choice_x_seller/state/bloc/order/order_bloc.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_bloc.dart';
import 'package:choice_x_seller/state/get_x/variant_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(VariantController());

  Get.put(SellerRegCtrl());
  Get.put(AudioPreviewController());
  Get.put(AddProductController());
  Get.put(MessageListController());
  Get.put(SellerOrderController());

  Get.put(ArcProgressController());

  Get.put(OrderStatusController());
<<<<<<< HEAD
   Get.put(AddProductController());
=======
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<ProductCrudBloc>(
          create: (context) => ProductCrudBloc(),
        ),
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(),
        ),
        BlocProvider<OrderBloc>(
          create: (context) => OrderBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.white,
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
