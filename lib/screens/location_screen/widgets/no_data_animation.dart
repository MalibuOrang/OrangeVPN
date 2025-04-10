import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/widget.dart';

class NoDataAnimation extends StatelessWidget {
  const NoDataAnimation({
    super.key,
    required this.screenSize,
  });
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  'assets/animations/no_data.json',
                  width: screenSize.width * 0.7,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
