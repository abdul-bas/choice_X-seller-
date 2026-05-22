
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/common/texts/text_inter.dart';
import 'package:flutter/material.dart';


class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    this.buttonColor,
    this.text,
    this.textcolor,
    this.buttonHight,
    this.function,
    this.buttonWidth,
    this.fontSize,
    this.fontWeight,
  });

  final Color? textcolor;
  final String? text;
  final Color? buttonColor;
  final double? buttonHight;
  final double? buttonWidth;
  final Function? function;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHight,
      width: buttonWidth,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            buttonColor ?? AppColors.white,          
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        onPressed: () {
          if (function != null) function!();
        },
        child: TextInter(
          text: text ?? 'Accept',
          fontWeight: fontWeight,
          color: textcolor ?? AppColors.black,          
          fontSize: fontSize ?? 10,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}