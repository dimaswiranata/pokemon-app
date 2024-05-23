import 'package:flutter/material.dart';

import 'package:nexus_app/core/index.dart';

class AntiHeader extends StatelessWidget implements PreferredSizeWidget {
  const AntiHeader({
    super.key,
    this.title,
    this.alignTitle = Alignment.center,
    this.left,
    this.center,
    this.right,
    this.hideLeft = false,
    this.height,
    this.headerDecoration,
  });

  final AlignmentGeometry? alignTitle;
  final String? title;
  final Widget? left;
  final Widget? center;
  final Widget? right;
  final bool hideLeft;
  final double? height;
  final BoxDecoration? headerDecoration;

  @override
  Size get preferredSize => Size.fromHeight(height ?? headerHeight);

  Widget _buildLeft(BuildContext context) {
    if (hideLeft == true) {
      return Opacity(
        opacity: 0,
        child: AntiContainer(
          paddingHorizontal: space.reg,
          paddingVertical: space.reg,
          child: Icon(
            Icons.chevron_left,
            color: primaryColor,
          ),
        ),
      );
    }
    if (left == null) {
      return AntiContainer(
        paddingRight: space.reg,
        paddingLeft: space.xs,
        height: headerHeight,
        onTap: () => Navigator.of(context).pop(),
        child: AntiIcon(
          color: primaryColor,
          iconName: IconName.app_arrow_left,
          iconType: IconType.app,
          size: 36,
        ),
      );
    }
    return left!;
  }

  Widget _buildCenter(BuildContext context) {
    if (center == null) {
      return AntiContainer(
        alignment: alignTitle,
        maxWidth: MediaQuery.of(context).size.width - (60 * 2),
        child: Text(
          title ?? '',
          style: bodyH4.copyWith(
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.left,
        ),
      );
    }
    return center!;
  }

  Widget _buildRight() {
    if (right == null) {
      return AntiContainer(
        paddingHorizontal: space.sm,
        paddingVertical: space.reg,
        child: Opacity(
          opacity: 0,
          child: Icon(
            Icons.chevron_right,
            color: primaryColor,
          ),
        ),
      );
    }

    return right!;
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return PreferredSize(
      preferredSize: preferredSize,
      child: AntiContainer(
        paddingTop: topPadding,
        height: (height ?? headerHeight) + topPadding,
        decoration: headerDecoration,
        child: AntiContainer(
          height: (height ?? headerHeight),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: _buildLeft(context),
              ),
              Align(
                alignment: Alignment.center,
                child: _buildCenter(context),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: _buildRight(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
