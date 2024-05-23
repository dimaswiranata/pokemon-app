// ignore_for_file: sort_child_properties_last

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:nexus_app/core/index.dart';

class AntiSwiper extends StatefulWidget {
  const AntiSwiper({
    super.key,
    required this.page,
    this.height,
    this.width,
    this.viewportFraction,
    this.auto = false,
    this.duration,
    this.dotTransformX,
    this.dotTransformY,
    this.alignment,
    this.dotActiveHeight,
    this.dotActiveWidth,
    this.dotBorderRadius,
    this.dotActiveBorderRadius,
    this.dotColor,
    this.dotActiveColor,
    this.dotHeight,
    this.dotWidth,
    this.dotSpacing,
    this.onChangedPage,
    this.effect,
    this.showIndicator = true,
  });

  final List<Widget> page;
  final double? viewportFraction;
  final bool auto;
  final int? duration;
  final double? height, width;
  final bool showIndicator;

  // dotTransformX → for horizontal, > 0 for right, < 0 for left
  // dotTransformY → for vertical, > 0 for bottom, < 0 for top
  final double? dotTransformX, dotTransformY;

  final AlignmentGeometry? alignment;
  final double? dotWidth, dotHeight, dotActiveWidth, dotActiveHeight, dotBorderRadius, dotActiveBorderRadius;
  final Color? dotColor, dotActiveColor;
  final double? dotSpacing;
  final void Function(int)? onChangedPage;

  // read more : https://pub.dev/packages/smooth_page_indicator
  final IndicatorEffect? effect;

  @override
  State<AntiSwiper> createState() => _AntiSwiperState();
}

class _AntiSwiperState extends State<AntiSwiper> {
  int _currentPage = 0;
  late Timer _timer;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: widget.viewportFraction ?? 1.0,
      keepPage: true,
    );
    if (widget.auto == true) _init();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.auto == true) _timer.cancel();
  }

  void _init() {
    _timer = Timer.periodic(Duration(milliseconds: widget.duration ?? 3000), (Timer timer) {
      if (_currentPage < widget.page.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: widget.height ?? 240,
          width: widget.width ?? double.infinity,
          child: PageView(
            controller: _pageController,
            children: widget.page,
            onPageChanged: widget.onChangedPage,
          ),
        ),
        widget.showIndicator
            ? Positioned(
                bottom: 0,
                child: AntiContainer(
                  width: MediaQuery.of(context).size.width,
                  alignment: widget.alignment ?? Alignment.center,
                  transform: Matrix4.translationValues(widget.dotTransformX ?? 0.0, widget.dotTransformY ?? 0.0, 0.0),
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: widget.page.length,
                      effect: widget.effect ??
                          CustomizableEffect(
                            activeDotDecoration: DotDecoration(
                                width: widget.dotActiveWidth ?? space.xl,
                                height: widget.dotActiveHeight ?? space.sm,
                                color: widget.dotActiveColor ?? primaryColor,
                                borderRadius: BorderRadius.circular(widget.dotActiveBorderRadius ?? radius.full)),
                            dotDecoration: DotDecoration(
                                width: widget.dotWidth ?? space.sm,
                                height: widget.dotHeight ?? space.sm,
                                color: widget.dotColor ?? Colors.grey,
                                borderRadius: BorderRadius.circular(widget.dotActiveBorderRadius ?? radius.full)),
                            spacing: widget.dotSpacing ?? space.sm,
                          ),
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}
