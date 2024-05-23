import 'package:flutter/material.dart';
import 'package:nexus_app/core/index.dart';

class AntiAnimatedOpacity extends StatelessWidget {
  const AntiAnimatedOpacity({
    super.key,
    required this.child,
    this.type = OpacityType.FADE_IN,
    this.isSelected = false,
    this.milliseconds,
    this.curves,
    this.onEnd,
  });

  final Widget child;
  final OpacityType? type;
  final bool? isSelected;
  final int? milliseconds;
  final Curve? curves;
  final void Function()? onEnd;

  @override
  Widget build(BuildContext context) {
    double fromOpacity = type == OpacityType.FADE_IN ? 0.0 : 1.0;
    double toOpacity = type == OpacityType.FADE_IN ? 1.0 : 0.0;

    return AnimatedOpacity(
      child: child,
      opacity: isSelected == false ? fromOpacity : toOpacity,
      duration: Duration(milliseconds: milliseconds ?? 500),
      curve: curves ?? Curves.linear,
      onEnd: onEnd,
    );
  }
}
