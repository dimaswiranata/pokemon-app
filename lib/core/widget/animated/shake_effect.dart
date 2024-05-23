import 'dart:math';

import 'package:flutter/material.dart';

class AntiShakeEffect extends StatelessWidget {
  const AntiShakeEffect({super.key, required this.child, required this.animation, this.shakeOffset = 2, this.shakeCount = 4});

  final Widget child;
  final Animation<double> animation;
  final double shakeOffset;
  final double shakeCount;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        final sinValue = sin(shakeCount * 2 * pi * animation.value);
        return Transform.translate(
          offset: Offset(sinValue * shakeOffset, 0),
          child: child,
        );
      },
    );
  }
}
