import 'dart:ui';

import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:wave_widget/wave_widget.dart';
Widget buildWave() {
  return WavesWidget(
    size: const Size(240, 240),
    amplitude: 12,
    frequency: 0.5,
    waveLayers: [
      WaveLayer.solid(
        duration: 3000,
        heightFactor: 0.5,
        color: AppColors.brand.withRed(10),
        waveShape: WaveShape.triangle(),
      ),
      WaveLayer.gradient(
        duration: 2500,
        heightFactor: 0.5,
        gradient: const LinearGradient(
          colors: [AppColors.sellerSurface,AppColors.sellerSurfaceInput],
        ),
        waveShape: WaveShape.triangle(),
      ),
        WaveLayer.solid(
        duration: 3000,
        heightFactor: 0.5,
        color: AppColors.brand,
        waveShape: WaveShape.triangle(),
      ),
    ],
  );
}