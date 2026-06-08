import 'package:choice_x_seller/config/sidebar_menu_data..dart';
import 'package:choice_x_seller/core/widgets/side_menu_bar.dart/sid_menu_bar.dart';
import 'package:choice_x_seller/state/get_x/toggle_menubar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SellerMainLayout extends StatelessWidget {
  SellerMainLayout({super.key});

  final DashbordSideview controller = Get.put(DashbordSideview());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final index = controller.index.value;

      return LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 900;
          final isTablet =
              constraints.maxWidth >= 900 && constraints.maxWidth < 1200;
          final isDesktop = constraints.maxWidth >= 1200;

          return Scaffold(
            drawer: SideMenuBar(
                value: index,
                isDrawer: true,
                isMobile: isMobile,
                toggleMenubarController: controller),
            body: Row(
              children: [
                if (!isMobile)
                  SideMenuBar(
                      value: index,
                      isDrawer: false,
                      isMobile: isMobile,
                      toggleMenubarController: controller),
                Expanded(
                    child: menuItems[index]
                        ['navigation'](isDesktop, isMobile, isTablet)),
              ],
            ),
          );
        },
      );
    });
  }
}
