import 'package:flutter/material.dart';

class AntiFadeTransition extends StatelessWidget {
  const AntiFadeTransition({
    super.key,
    required this.child,
    required this.animation,
  });

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
