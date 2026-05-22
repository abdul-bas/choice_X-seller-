
import 'package:flutter/material.dart';

class AppBarConfig {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accent;
  final String? searchHint;
  final String? addLabel;

  const AppBarConfig({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
    this.searchHint,
    this.addLabel,
  });
}