import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    this.radius = 30,
    required this.color,
    required this.child,
  });
  final double? radius;
  final Color color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      child: child,
    );
  }
}
