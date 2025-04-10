import 'package:expance_tracker/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoaderAnimation extends StatelessWidget {
  const LoaderAnimation({
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
                  'assets/animations/servers_loading.json',
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
