import 'package:flutter/material.dart';
import 'package:nexus_app/core/index.dart';

class AntiSection extends StatelessWidget {
  final bool hide;
  final bool hideRight;
  final Widget? right;
  final String? rightTitle;
  final void Function()? rightOnPress;
  final TextStyle? rightTextStyle;
  final bool hideLeft;
  final Widget? left;
  final String? leftTitle;
  final void Function()? leftOnPress;
  final TextStyle? leftTextStyle;
  final Widget? child;
  final double? headerMarginTop;
  final double? headerMarginHorizontal;
  final double? headerMarginBottom;
  final Color? bgColor;
  const AntiSection(
      {Key? key,
      this.hide = false,
      this.hideRight = false,
      this.rightTitle,
      this.right,
      this.rightOnPress,
      this.rightTextStyle,
      this.hideLeft = false,
      this.left,
      this.leftTitle,
      this.leftOnPress,
      this.leftTextStyle,
      this.headerMarginTop,
      this.headerMarginHorizontal,
      this.headerMarginBottom,
      this.child,
      this.bgColor});

  Widget _buildLeft(BuildContext context) {
    if (hideLeft) return Container();
    if (left != null) {
      return left!;
    }
    if (leftTitle != null) {
      return GestureDetector(
        onTap: leftOnPress ?? () {},
        child: Text(
          leftTitle!,
          style: leftTextStyle ?? headingH4.copyWith(fontWeight: FontWeight.w600),
        ),
      );
    }
    return Container();
  }

  Widget _buildRight(BuildContext context) {
    if (hideRight) return Container();
    if (right != null) {
      return right!;
    }
    if (rightTitle != null) {
      return GestureDetector(
        onTap: rightOnPress ?? () {},
        child: Text(
          rightTitle!.toUpperCase(),
          style: rightTextStyle ?? headingCaption.copyWith(color: secondaryGold, fontWeight: FontWeight.w600),
        ),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    if (hide) return Container();
    return Container(
      decoration: BoxDecoration(color: bgColor),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: headerMarginTop ?? 0,
                right: headerMarginHorizontal ?? 0,
                left: headerMarginHorizontal ?? 0,
                bottom: headerMarginBottom ?? 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildLeft(context),
                _buildRight(context),
              ],
            ),
          ),
          child ?? Container()
        ],
      ),
    );
  }
}
