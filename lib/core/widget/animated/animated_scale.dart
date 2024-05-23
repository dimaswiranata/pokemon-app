import 'package:flutter/material.dart';

class AntiAnimatedScale extends StatelessWidget {
  const AntiAnimatedScale({
    Key? key,
    required this.child,
    this.isSelected = false,
    this.milliseconds,
    this.curves,
    this.onEnd,
    this.initialScale = 0.99,
    this.finalScale = 1.0,
  }) : super(key: key);

  final Widget child;
  final bool? isSelected;
  final int? milliseconds;
  final Curve? curves;
  final void Function()? onEnd;
  final double initialScale;
  final double finalScale;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: milliseconds ?? 500),
      curve: curves ?? Curves.linear,
      transformAlignment: Alignment.center,
      transform: Matrix4.identity()..scale(isSelected == false ? initialScale : finalScale),
      child: child,
      onEnd: onEnd,
    );
  }
}
