
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInter extends StatelessWidget {
  const TextInter({
    super.key,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.color,
    required this.text,
    this.maxLines,
    this.overFlow,
    this.textAlign,
    this.wordSpace,
  });

  final double?        fontSize;
  final FontWeight?    fontWeight;
  final double?        letterSpacing;
  final Color?         color;      
  final String         text;
  final double?        wordSpace;
  final TextOverflow?  overFlow;
  final int?           maxLines;
  final TextAlign?     textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow:  overFlow,
      maxLines:  maxLines,
      textAlign: textAlign,
      style: GoogleFonts.inter(
        fontSize:      fontSize      ?? 14,
        fontWeight:    fontWeight    ?? FontWeight.bold,
        letterSpacing: letterSpacing ?? -1,
        color:         color         ?? AppColors.white,
        wordSpacing:   wordSpace     ?? 0,
      ),
    );
  }
}