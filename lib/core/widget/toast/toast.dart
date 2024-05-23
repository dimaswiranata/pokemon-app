import 'package:flutter/material.dart';

import 'package:nexus_app/core/index.dart';

class AntiToast extends StatelessWidget {
  const AntiToast(
      {Key? key,
      this.onClose,
      this.onTap,
      this.subtitle,
      this.title,
      this.titleStyle,
      this.subTitleStyle,
      this.type = ToastType.INFO,
      this.variant = ToastVariant.filled,
      this.rounded,
      this.showClose = true,
      this.left,
      this.right,
      this.center})
      : super(key: key);
  final void Function()? onClose;
  final void Function()? onTap;
  final ToastType type;
  final ToastVariant variant;
  final double? rounded;
  final String? title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subTitleStyle;
  final bool showClose;
  final Widget? left;
  final Widget? right;
  final Widget? center;

  Color _getBackground() {
    switch (type) {
      case ToastType.ERROR:
        if (variant == ToastVariant.filled) {
          return toastStyle.errorBaseColor!;
        } else {
          return toastStyle.errorOutlineColor!;
        }
      case ToastType.WARNING:
        if (variant == ToastVariant.filled) {
          return toastStyle.warningBaseColor!;
        } else {
          return toastStyle.warningOutlineColor!;
        }

      case ToastType.SUCCESS:
        if (variant == ToastVariant.filled) {
          return toastStyle.successBaseColor!;
        } else {
          return toastStyle.successOutlineColor!;
        }
      case ToastType.INFO:
        if (variant == ToastVariant.filled) {
          return toastStyle.infoBaseColor!;
        } else {
          return toastStyle.infoOutlineColor!;
        }
      case ToastType.APP:
        if (variant == ToastVariant.filled) {
          return toastStyle.appBaseColor!;
        } else {
          return toastStyle.appOutlineColor!;
        }
    }
  }

  Color _getBaseColor() {
    switch (type) {
      case ToastType.ERROR:
        return toastStyle.errorBaseColor!;
      case ToastType.WARNING:
        return toastStyle.warningBaseColor!;
      case ToastType.SUCCESS:
        return toastStyle.successBaseColor!;
      case ToastType.INFO:
        return toastStyle.infoBaseColor!;
      case ToastType.APP:
        return toastStyle.appBaseColor!;
    }
  }

  Color _getFilledBaseColor() {
    switch (type) {
      case ToastType.ERROR:
        return toastStyle.errorFilledBaseColor!;
      case ToastType.WARNING:
        return toastStyle.warningFilledBaseColor!;
      case ToastType.SUCCESS:
        return toastStyle.successFilledBaseColor!;
      case ToastType.INFO:
        return toastStyle.infoFilledBaseColor!;
      case ToastType.APP:
        return toastStyle.appFilledBaseColor!;
    }
  }

  IconData _getIcons() {
    switch (type) {
      case ToastType.ERROR:
        return Icons.cancel;
      case ToastType.WARNING:
        return Icons.warning_rounded;
      case ToastType.SUCCESS:
        return Icons.check_circle_outline;
      case ToastType.INFO:
        return Icons.info_rounded;
      case ToastType.APP:
        return Icons.info_rounded;
    }
  }

  Widget _buildCenter(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (center != null) return center!;
    return AntiContainer(
      width: width * 0.6,
      marginLeft: space.reg,
      children: [
        title!.isNotEmpty
            ? Text(
                title ?? '',
                style: titleStyle ??
                    bodyBodySm.copyWith(
                      color: variant == ToastVariant.filled ? _getFilledBaseColor() : _getBaseColor(),
                      height: subtitle!.isNotEmpty ? 1.3 : 1.5,
                      fontWeight: FontWeight.w600,
                    ),
              )
            : Container(),
        subtitle!.isNotEmpty
            ? Text(subtitle ?? '',
                style: subTitleStyle ??
                    Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: variant == ToastVariant.filled ? _getFilledBaseColor() : toastStyle.subtitleColor!))
            : Container(),
      ],
    );
  }

  Widget _buildIcon() {
    if (left != null) return left!;
    return SizedBox(
      child: Icon(
        _getIcons(),
        color: variant == ToastVariant.filled ? _getFilledBaseColor() : _getBaseColor(),
      ),
    );
  }

  Widget _buildLeft(BuildContext context) {
    return AntiContainer(
      flexDir: FlexDirection.ROW,
      crossAxis: CrossAxisAlignment.start,
      mainAxis: MainAxisAlignment.start,
      children: [_buildIcon(), _buildCenter(context)],
    );
  }

  Widget _buildRight() {
    if (right != null) return right!;
    if (showClose == false) return Container();
    return GestureDetector(
      onTap: onClose,
      child: Icon(
        Icons.clear,
        color: variant == ToastVariant.filled ? _getFilledBaseColor() : _getBaseColor(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap ?? () {},
      child: AntiContainer(
        width: width,
        paddingHorizontal: space.reg,
        paddingTop: space.md,
        paddingBottom: subtitle!.isEmpty ? space.md : space.md,
        flexDir: FlexDirection.ROW,
        borderRadius: rounded ?? radius.none,
        crossAxis: subtitle!.isEmpty ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxis: MainAxisAlignment.spaceBetween,
        borderColor: variant == ToastVariant.outline ? _getBaseColor() : Colors.transparent,
        bgColor: variant == ToastVariant.boxless ? toastStyle.boxlessColor : _getBackground(),
        children: [_buildLeft(context), _buildRight()],
      ),
    );
  }
}
