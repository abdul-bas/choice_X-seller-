import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/log_out/dialogs/log_out_dialog.dart';
import 'package:choice_x_seller/screen/log_out/log_out_button.dart';
import 'package:choice_x_seller/state/get_x/toggle_menubar.dart';
import 'package:choice_x_seller/config/sidebar_menu_data..dart';
import 'package:choice_x_seller/core/constants/app_color.dart';
import 'package:choice_x_seller/core/widgets/side_menu_bar.dart/logo_mark.dart';
import 'package:flutter/material.dart';



class SideMenuBar extends StatelessWidget {
  const SideMenuBar(
      {super.key,
      
      required this.value,
      required this.isDrawer,
      required this.isMobile,
      required this.toggleMenubarController});

 
  final int value;
  final bool isDrawer;
  final bool isMobile;
  final DashbordSideview toggleMenubarController;

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 220,
          margin: isMobile ? null : const EdgeInsets.fromLTRB(10, 10, 0, 10),
          decoration: BoxDecoration(
            color: AppColors.sellerSurface,
            borderRadius:
                isMobile ? null : BorderRadius.all(Radius.circular(16)),
          ),
          child: Focus(
            autofocus: true,
            child: Column(
              children: [
                Container(
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade900, width: 1),
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: LogoMark(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'NAVIGATIONS',
                      style: TextStyle(
                        color: kAccentDim.withOpacity(0.5),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    children: menuItems.asMap().entries.map((entry) {
                      final int index = entry.key;
                      final items = entry.value;
                      final bool isSelected = index == value;

                      return GestureDetector(
                        onTap: () {
                          toggleMenubarController.toggleIndex(index);
                        
                          if (isDrawer) Navigator.pop(context);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          height: 46,
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.white : AppColors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                items['icon'] as IconData?,
                                size: 18,
                                color: isSelected ? kSelectedText : kAccentDim,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  items['title'] as String? ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color:
                                        isSelected ? kSelectedText : kAccentDim,
                                    fontSize: 14,
                                    fontWeight: isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                LogOut(onTap: () => showLogoutDialog(context)),
              ],
            ),
          ),
        );
  }
}
