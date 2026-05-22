
import 'package:choice_x_seller/config/sidebar_menu_data..dart';
import 'package:choice_x_seller/core/constants/app_color.dart';

import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
   const TopAppBar({super.key, 
    required this.isMobile,
    required this.selectIndex,
    required this.proIndex,
   
  });

  final bool isMobile;
  final int selectIndex;
  final int proIndex;
  
  String get _title {
    final item = menuItems[selectIndex];
    final children = item['children'] as List;
    if (children.isNotEmpty) return children[proIndex]['title'] as String;
    return item['title'] as String;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: card,
        border: Border(bottom: BorderSide(color: kBorder, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            
            if (isMobile)
              Builder(
                builder: (ctx) => InkWell(
                  onTap: () => Scaffold.of(ctx).openDrawer(),
                  borderRadius: BorderRadius.circular(8),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.menu_rounded,
                        color: kAccent, size: 22),
                  ),
                ),
              ),

            
            
            
            if (!isMobile) ...[
              const SizedBox(width: 24),
              Container(width: 1, height: 20, color: kBorder),
              const SizedBox(width: 24),
              Text(
                _title.toUpperCase(),
                style: const TextStyle(
                  color: kAccentDim,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
            ],

            const Spacer(),

           
           
          ],
        ),
      ),
    );
  }
}
