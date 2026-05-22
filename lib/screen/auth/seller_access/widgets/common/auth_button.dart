import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/common/texts/text_inter.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.width,
    this.color,
    required this.text,
    this.textColor,
    this.fontSize,
    this.icon,
    this.function,
    this.hight,
    this.radius,
  });

  final double width;
  final Color? color;
  final String text;
  final Color? textColor;
  final Icon? icon;
  final Function()? function;
  final double? fontSize;
  final double? hight;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: function,
        child: Container(
          height: hight ?? 40,
          width: width * 0.85,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.black26),
            color: color ?? AppColors.brand,
            borderRadius: BorderRadius.circular(radius ?? 7),
          ),
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? const SizedBox.shrink(),
              TextInter(
                text: text,
                letterSpacing: 0.5,
                wordSpace: 1,
                color: textColor,
                fontWeight: FontWeight.w700,
                fontSize: fontSize ?? 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
