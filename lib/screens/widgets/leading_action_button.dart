import 'package:expance_tracker/theme/theme.dart';
import 'package:flutter/material.dart';

class LeadingActionButton extends StatelessWidget {
  const LeadingActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 10,
      onTap: onPressed,
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).actionContainerColor,
        ),
        child: Icon(
          icon,
          color: Theme.of(context).actionIconColor,
          size: 26,
        ),
      ),
    );
  }
}
