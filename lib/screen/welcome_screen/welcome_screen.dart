import 'dart:math';
import 'package:choice_x_seller/screen/auth/listeners/auth_gate.dart';
import 'package:choice_x_seller/core/utils/navigation/push.dart';
import 'package:choice_x_seller/screen/auth/seller_access/seller_access_Page.dart';
import 'package:choice_x_seller/state/bloc/auth/authBoloc.dart';
import 'package:choice_x_seller/state/bloc/auth/events/auth_event.dart';
import 'package:choice_x_seller/state/get_x/toggle_login_or_register.dart';
import 'package:choice_x_seller/screen/common/texts/text_crimson.dart';
import 'package:choice_x_seller/screen/common/texts/text_inter.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/seller_registation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  final AuthPageSwitcher _loginOrRegister = Get.put(AuthPageSwitcher());
  late AnimationController controller;
  late Animation<double> rotateAnim;
  late Animation<double> scaleAnim;
  late Animation<double> opacityAnim;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    rotateAnim = Tween<double>(begin: -1, end: 4 * pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticIn));
    scaleAnim = Tween<double>(begin: -1, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );
    opacityAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );
    super.initState();
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context.read<AuthBloc>().add(AuthVerifySeller()),
    );
    return Scaffold(body: authGate(
      child: LayoutBuilder(builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Obx(
                      () => ToggleButtons(
                          borderRadius: BorderRadius.circular(5),
                          fillColor: Colors.white,
                          isSelected: _loginOrRegister.isSelected,
                          onPressed: ((int index) {
                            _loginOrRegister.toggleIndex(index);
                            _loginOrRegister.isSelected[1]
                                ? push(context, SellerRegistrationPage())
                                : push(context, SellerAuthPage());
                          }),
                          children: [
                            SizedBox(
                                width: 100,
                                child: Center(
                                    child: TextCrimson(
                                  text: 'Login',
                                  color: _loginOrRegister.isSelected[0]
                                      ? Colors.black
                                      : Colors.white,
                                  letterSpacing: 1,
                                ))),
                            SizedBox(
                                width: 150,
                                child: Center(
                                    child: TextCrimson(
                                  text: 'Start Selling',
                                  color: _loginOrRegister.isSelected[1]
                                      ? Colors.black
                                      : Colors.white,
                                  letterSpacing: 1,
                                ))),
                          ]),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Center(
                child: Stack(
                  children: [
                    AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: rotateAnim.value,
                            child: Transform.scale(
                              scale: scaleAnim.value,
                              child: Opacity(
                                opacity: opacityAnim.value,
                                child: Container(
                                  height: 300,
                                  width: 400,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/new_One-removebg-preview.png'))),
                                ),
                              ),
                            ),
                          );
                        }),
                    if (!isMobile)
                      SizedBox(
                        height: 310,
                      ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextInter(
                              text:'ChoiceX Seller Console',
                              fontSize: isMobile ? 25 : 30,
                              letterSpacing: 0.5,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                                width: 500,
                                child: TextCrimson(
                                  textOverflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  text:
                                     'Handle products, monitor sales\n& deliver a better shopping experience',
                                  color: Colors.grey,
                                  fontSize: isMobile ? 10 : 13,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 2,
                                  wordSpace: 1,
                                )),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    ));
  }
}
