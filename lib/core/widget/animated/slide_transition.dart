import 'package:flutter/material.dart';

class AntiSlideTransition extends StatelessWidget {
  const AntiSlideTransition(
      {super.key, required this.child, required this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0.0, 0.5),
              end: Offset.zero,
            ).animate(animation),
            child: child);
      },
    );
  }
}
