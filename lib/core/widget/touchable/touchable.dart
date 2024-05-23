import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AntiTouchable extends StatelessWidget {
  const AntiTouchable({
    Key? key,
    this.width,
    this.height,
    this.activeOpacity = 1,
    this.margin,
    this.padding,
    this.radius = 12,
    this.children,
    this.bgColor,
    this.splashColor,
    this.hoverColor,
    this.highlightColor,
    this.isHapticEnabled = false,
    required this.onPressed,
  }) : super(key: key);
  final double? height;
  final double? width;
  final double activeOpacity;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double radius;
  final Widget? children;
  final Color? bgColor;
  final Color? splashColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final bool isHapticEnabled;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: bgColor,
      ),
      child: Center(
        child: InkWell(
          onTap: () {
            isHapticEnabled ? HapticFeedback.lightImpact() : null;
            onPressed();
          },
          borderRadius: BorderRadius.circular(radius),
          splashColor: splashColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          enableFeedback: true,
          child: children,
        ),
      ),
    );
  }
}
