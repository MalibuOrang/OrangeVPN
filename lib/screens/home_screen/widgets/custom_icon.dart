import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    this.size = 30,
    required this.color,
    required this.icon,
  });
  final Color color;
  final IconData icon;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
