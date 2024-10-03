import 'package:expance_tracker/main.dart';
import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  final String title, subtitle;
  final Widget icon;
  const HomeCardWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width * 0.45,
      child: Column(
        children: [
          icon,
          SizedBox(
            height: 6,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).lightText,
            ),
          ),
        ],
      ),
    );
  }
}
