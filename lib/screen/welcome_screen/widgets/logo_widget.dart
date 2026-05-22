import 'package:flutter/material.dart';
class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    required this.height,
    required this.width,
    required this.url,
    required this.boxfit,
  });

  final double height;
  final double width;
  final String url;
  final BoxFit boxfit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(
        url,
        fit: boxfit,
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(
              Icons.image_not_supported,
              size: 80,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}