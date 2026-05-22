import 'package:flutter/material.dart';
Color getColorFromPercentage(num value) {
  if (value <= 10) {
    return const Color(0xFFA32D2D); 
  } else if (value <= 20) {
    return const Color(0xFFE24B4A); 
  } else if (value <= 30) {
    return const Color(0xFFD85A30); 
  } else if (value <= 40) {
    return const Color(0xFFEF9F27); 
  } else if (value <= 50) {
    return const Color(0xFFBA7517); 
  } else if (value <= 60) {
    return const Color(0xFFE8C44A); 
  } else if (value <= 70) {
    return const Color(0xFF97C459); 
  } else if (value <= 80) {
    return const Color(0xFF1D9E75); 
  } else if (value <= 90) {
    return const Color(0xFF0F6E56);
  } else {
    return const Color(0xFF7F77DD);
  }
}