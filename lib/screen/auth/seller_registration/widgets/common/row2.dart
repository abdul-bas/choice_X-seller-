import 'package:flutter/material.dart';

class Row2 extends StatelessWidget {
  const Row2({super.key, required this.left, required this.right});
  final Widget left, right;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 420) {
      return Column(children: [left, const SizedBox(height: 16), right]);
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: left),
        const SizedBox(width: 14),
        Expanded(child: right),
      ],
    );
  }
}