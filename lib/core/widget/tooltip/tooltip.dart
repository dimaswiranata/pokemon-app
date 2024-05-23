import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

class AntiTooltip extends StatelessWidget {
  final Widget content;
  final TooltipDirection popupDirection;
  final SuperTooltipController? controller;
  final void Function()? onLongPress;
  final void Function()? onShow;
  final void Function()? onHide;
  final bool snapsFarAwayVertically;
  final bool snapsFarAwayHorizontally;
  final bool? hasShadow;
  final Color? shadowColor;
  final double? shadowBlurRadius;
  final double? shadowSpreadRadius;
  final double? top, right, bottom, left;
  final ShowCloseButton? showCloseButton;
  final Color? closeButtonColor;
  final double? closeButtonSize;
  final double minimumOutsideMargin;
  final double verticalOffset;
  final Widget? child;
  final Color borderColor;
  final BoxConstraints constraints;
  final Color? backgroundColor;
  final Decoration? decoration;
  final double elevation;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;
  final double arrowLength;
  final double arrowBaseWidth;
  final double arrowTipDistance;
  final double borderRadius;
  final double borderWidth;
  final bool? showBarrier;
  final Color? barrierColor;
  final Rect? touchThrougArea;
  final ClipAreaShape touchThroughAreaShape;
  final double touchThroughAreaCornerRadius;
  final EdgeInsetsGeometry overlayDimensions;
  final EdgeInsetsGeometry bubbleDimensions;

  //filter
  final bool showDropBoxFilter;
  final double sigmaX;
  final double sigmaY;

  const AntiTooltip({
    super.key,
    required this.content,
    this.popupDirection = TooltipDirection.down,
    this.controller,
    this.onLongPress,
    this.onShow,
    this.onHide,
    this.showCloseButton,
    this.closeButtonColor,
    this.closeButtonSize,
    this.showBarrier,
    this.barrierColor,
    this.snapsFarAwayVertically = false,
    this.snapsFarAwayHorizontally = false,
    this.hasShadow,
    this.shadowColor,
    this.shadowBlurRadius,
    this.shadowSpreadRadius,
    this.top,
    this.right,
    this.bottom,
    this.left,
    // TD: Make edgeinsets instead
    this.minimumOutsideMargin = 20.0,
    this.verticalOffset = 0.0,
    this.elevation = 0.0,
    // TD: The native flutter tooltip uses verticalOffset
    //  to space the tooltip from the child. But we'll likely
    // need just offset, since it's 4 way directional
    // this.verticalOffset = 24.0,
    this.backgroundColor,
    this.decoration,
    this.child,
    this.borderColor = Colors.black,
    this.constraints = const BoxConstraints(
      minHeight: 0.0,
      maxHeight: double.infinity,
      minWidth: 0.0,
      maxWidth: double.infinity,
    ),
    this.fadeInDuration = const Duration(milliseconds: 150),
    this.fadeOutDuration = const Duration(milliseconds: 0),
    this.arrowLength = 20.0,
    this.arrowBaseWidth = 20.0,
    this.arrowTipDistance = 2.0,
    this.touchThroughAreaShape = ClipAreaShape.oval,
    this.touchThroughAreaCornerRadius = 5.0,
    this.touchThrougArea,
    this.borderWidth = 0.0,
    this.borderRadius = 10.0,
    this.overlayDimensions = const EdgeInsets.all(10),
    this.bubbleDimensions = const EdgeInsets.all(10),
    this.sigmaX = 5.0,
    this.sigmaY = 5.0,
    this.showDropBoxFilter = false,
  });

  @override
  Widget build(BuildContext context) {
    return SuperTooltip(
      content: content,
      popupDirection: popupDirection,
      controller: controller,
      onLongPress: onLongPress,
      onShow: onShow,
      onHide: onHide,
      showCloseButton: showCloseButton,
      closeButtonColor: closeButtonColor,
      closeButtonSize: closeButtonSize,
      showBarrier: showBarrier,
      barrierColor: barrierColor,
      snapsFarAwayVertically: snapsFarAwayVertically,
      snapsFarAwayHorizontally: snapsFarAwayHorizontally,
      hasShadow: hasShadow,
      shadowColor: shadowColor,
      shadowBlurRadius: shadowBlurRadius,
      shadowSpreadRadius: shadowSpreadRadius,
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      // TD: Make edgeinsets instead
      minimumOutsideMargin: minimumOutsideMargin,
      verticalOffset: verticalOffset,
      elevation: elevation,
      // TD: The native flutter tooltip uses verticalOffset
      //  to space the tooltip from the child. But we'll likely
      // need just offset, since it's 4 way directional
      // this.verticalOffset = 24.0,
      backgroundColor: backgroundColor,
      decoration: decoration,
      child: child,
      borderColor: borderColor,
      constraints: constraints,
      fadeInDuration: fadeInDuration,
      fadeOutDuration: fadeOutDuration,
      arrowLength: arrowLength,
      arrowBaseWidth: arrowBaseWidth,
      arrowTipDistance: arrowTipDistance,
      touchThroughAreaShape: touchThroughAreaShape,
      touchThroughAreaCornerRadius: touchThroughAreaCornerRadius,
      touchThroughArea: touchThrougArea,
      borderWidth: borderWidth,
      borderRadius: borderRadius,
      overlayDimensions: overlayDimensions,
      bubbleDimensions: bubbleDimensions,
      sigmaX: sigmaX,
      sigmaY: sigmaY,
      showDropBoxFilter: showDropBoxFilter,
    );
  }
}
