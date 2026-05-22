import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OrderStatusController extends GetxController
    with GetTickerProviderStateMixin {
  final Map<String, double> values = {};

  final Map<String, AnimationController> _controllers = {};

  double getValue(String key) {
    return values[key] ?? 0;
  }

  void startAnimation({
    required String key,
    required double target,
    Duration duration = const Duration(milliseconds: 1200),
  }) {
    _controllers[key]?.dispose();

    final controller = AnimationController(
      vsync: this,
      duration: duration,
    );

    final animation = Tween<double>(
      begin: 0,
      end: target,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutCubic,
      ),
    );

    animation.addListener(() {
      values[key] = animation.value;

      update();
    });

    _controllers[key] = controller;

    values[key] = 0;
    update();

    controller.forward();
  }

  @override
  void onClose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.onClose();
  }
}
