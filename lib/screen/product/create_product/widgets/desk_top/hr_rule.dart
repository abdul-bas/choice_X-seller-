

import 'package:flutter/material.dart';

class HRule extends StatelessWidget {
  const HRule({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      color: Colors.white.withValues(alpha: 0.08),
    );
  }
}