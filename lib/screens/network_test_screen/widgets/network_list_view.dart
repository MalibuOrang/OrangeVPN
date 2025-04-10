import 'package:flutter/material.dart';

class NetworkListView extends StatelessWidget {
  const NetworkListView({
    super.key,
    required this.screenSize,
    required this.children,
  });

  final Size screenSize;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        left: screenSize.width * 0.04,
        right: screenSize.width * 0.04,
        top: screenSize.height * 0.015,
        bottom: screenSize.height * 0.1,
      ),
      children: children,
    );
  }
}
