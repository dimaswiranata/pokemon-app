import 'dart:math';
import 'package:flutter/material.dart';

class AntiSwiperScaleInfinity extends StatefulWidget {
  const AntiSwiperScaleInfinity({
    super.key,
    required this.pageController,
    required this.listLength,
    required this.currentPageValue,
    this.onPageChanged,
    required this.buildChild,
    this.inactiveScale = 0.11,
  });

  final PageController pageController;
  final int listLength;
  final double currentPageValue;
  final Function(int)? onPageChanged;
  final Widget Function(double, int) buildChild;
  final double inactiveScale;

  @override
  State<AntiSwiperScaleInfinity> createState() => _AntiSwiperScaleInfinityState();
}

class _AntiSwiperScaleInfinityState extends State<AntiSwiperScaleInfinity> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: ClampingScrollPhysics(),
      controller: widget.pageController,
      onPageChanged: (value) {
        if (widget.onPageChanged != null) {
          widget.onPageChanged!(value);
          setState(() {});
        }
      },
      itemBuilder: (context, index) {
        double deference = index - widget.currentPageValue;
        if (deference < 0) {
          deference *= -1;
        }
        deference = min(1, deference);
        var scale = 1 - (deference * widget.inactiveScale);
        return TweenAnimationBuilder(
            tween: Tween(begin: scale, end: scale),
            duration: const Duration(milliseconds: 100),
            child: widget.buildChild(scale, index % widget.listLength),
            builder: (context, double value, child) {
              return Transform.scale(
                scale: value,
                child: child,
              );
            });
      },
    );
  }
}
