import 'package:flutter/material.dart';

class HelperSliverPersistentHeader extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget child;

  HelperSliverPersistentHeader({required this.height, required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: height,
      child: child,
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(HelperSliverPersistentHeader oldDelegate) {
    return height != oldDelegate.height || child != oldDelegate.child;
  }
}
