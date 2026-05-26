import 'package:flutter/material.dart';

class FadeSlideAnimation extends StatelessWidget {
  const FadeSlideAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(
        begin: 0.0,
        end: 1.0,
      ),
      duration: duration,
      curve: Curves.easeOutCubic,
      builder: (_, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(
              0,
              50 * (1 - value),
            ),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}