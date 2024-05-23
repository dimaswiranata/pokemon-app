import 'package:flutter/material.dart';
import 'package:nexus_app/core/index.dart';

class EmptyState extends StatefulWidget {
  const EmptyState({super.key, this.title, this.image});
  final String? title, image;

  @override
  State<EmptyState> createState() => _EmptyStateState();
}

class _EmptyStateState extends State<EmptyState> {
  @override
  Widget build(BuildContext context) {
    return AntiContainer(
      safeArea: true,
      expand: true,
      width: double.infinity,
      paddingHorizontal: space.reg,
      mainAxis: MainAxisAlignment.center,
      crossAxis: CrossAxisAlignment.center,
      children: [
        widget.image != null
            ? AntiImage(imageUrl: widget.image!, width: 172, height: 172)
            : AntiImage(imageUrl: 'assets/images/ic_empty.png', width: 172, height: 172),
        SizedBox(
          height: space.reg,
        ),
        widget.title != null
            ? Text(
                widget.title ?? '',
                style: bodyBodySm,
              )
            : SizedBox()
      ],
    );
  }
}
