import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBackground extends StatelessWidget {
  final Widget? child;
  const AppBackground({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ShaderMask(
            shaderCallback: (Rect bonus) {
              return LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black87.withValues(alpha: 0.01),
                  Colors.black87,
                ],
                stops: [
                  0.0,
                  0.7,
                  1.0,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bonus);
            },
            blendMode: BlendMode.dstIn,
            child: SvgPicture.asset(
              "assets/svg/bg.svg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        child ?? const SizedBox(),
      ],
    );
  }
}
