import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArcProgressController extends GetxController
    with GetTickerProviderStateMixin {
  

  final Map<String, double> _progressMap = {};


  final Map<String, AnimationController> _animControllers = {};
  final Map<String, Animation<double>> _animations = {};

  
  double get earnings => _progressMap['earnings'] ?? 0;
  double get orders => _progressMap['orders'] ?? 0;
  double get listings => _progressMap['listings'] ?? 0;
  double get messages => _progressMap['messages'] ?? 0;

  double getProgress(String key) =>
      _progressMap[key] ?? 0;

 
  void startAnimation({
    required String key,
    required double target,
    Duration duration = const Duration(milliseconds: 1400),
  }) {
   
    _animControllers[key]?.dispose();

    final animCtrl = AnimationController(
      vsync: this,
      duration: duration,
    );

    final anim = Tween<double>(
      begin: 0,
      end: target.clamp(0.0, 100.0),
    ).animate(
      CurvedAnimation(
        parent: animCtrl,
        curve: Curves.easeOutCubic,
      ),
    );

    anim.addListener(() {
      _progressMap[key] = anim.value;

    
      update();
    });

    _animControllers[key] = animCtrl;
    _animations[key] = anim;

    _progressMap[key] = 0;
    update();

    animCtrl.forward();
  }

  @override
  void onClose() {
    for (final c in _animControllers.values) {
      c.dispose();
    }
    super.onClose();
  }
}