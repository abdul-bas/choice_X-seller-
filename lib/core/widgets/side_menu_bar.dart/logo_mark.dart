

import 'package:choice_x_seller/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class LogoMark extends StatelessWidget {
  const LogoMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: kAccent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Center(
            child: Text(
              'CX',
              style: TextStyle(
                color: kBg,
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Choice_X',
          style: TextStyle(
            color: kAccent,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}