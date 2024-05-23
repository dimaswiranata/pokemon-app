import 'package:flutter/material.dart';

import 'package:nexus_app/core/index.dart';

class AntiButton extends StatefulWidget {
  final String text;
  final ButtonVariant? type;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? paddingHorizontal;
  final void Function() onPressed;
  final Color? bgColor;
  final Color? disableBgColor;
  final Color? disableTextColor;
  final Color? textColor;
  final Color? outlinedColor;
  final TextStyle? textStyle;
  final bool? loading;
  final bool? disabled;
  final Color? loadingColor;
  final ButtonSize? size;
  final Widget? left;
  final Widget? right;
  final Widget? child;
  final ButtonColor? color;
  final BorderRadius? borderRadius;
  final MainAxisAlignment? mainAxis;
  const AntiButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.type = ButtonVariant.filled,
    this.buttonWidth,
    this.buttonHeight,
    this.paddingHorizontal,
    this.bgColor,
    this.outlinedColor,
    this.disabled = false,
    this.textStyle,
    this.textColor,
    this.loading,
    this.loadingColor,
    this.size = ButtonSize.large,
    this.left,
    this.right,
    this.child,
    this.color = ButtonColor.primary,
    this.borderRadius,
    this.mainAxis,
    this.disableBgColor,
    this.disableTextColor,
  });

  @override
  State<AntiButton> createState() => _AntiButtonState();
}

class _AntiButtonState extends State<AntiButton> {
  AntiButtonStyle _base = buttonStyle;

  Widget _buildText() {
    if (widget.loading == true) {
      return AntiLoading(
        color: widget.loadingColor ?? widget.type!.value,
      );
    }
    if (widget.child != null) return widget.child!;
    if (widget.type != ButtonVariant.filled) {
      return Row(
        mainAxisAlignment: widget.mainAxis ?? MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.left ??
              Container(
                width: widget.right != null ? 0 : (widget.paddingHorizontal ?? space.xs),
              ),
          Flexible(
            child: Text(
              textAlign: TextAlign.center,
              widget.text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: widget.textStyle ??
                  _getTextStyle(context).copyWith(
                      color: widget.disabled == true
                          ? widget.disableTextColor ?? _base.disableTextColor
                          : (widget.textColor ?? widget.color!.value)),
            ),
          ),
          widget.right ??
              Container(
                width: widget.left != null ? 0 : (widget.paddingHorizontal ?? space.xs),
              ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: widget.mainAxis ?? MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.left ??
              Container(
                width: widget.right != null ? 0 : (widget.paddingHorizontal ?? space.xs),
              ),
          Flexible(
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: widget.textStyle ??
                  _getTextStyle(context).copyWith(
                      color: widget.disabled == true ? _base.disableFilledTextColor : (widget.textColor ?? _base.solidTextButton)),
            ),
          ),
          widget.right ??
              Container(
                width: widget.left != null ? 0 : (widget.paddingHorizontal ?? space.xs),
              ),
        ],
      );
    }
  }

  Widget _buildTextButton() {
    return TextButton(
        onPressed: widget.disabled == true
            ? null
            : widget.loading == true
                ? () {}
                : widget.onPressed,
        child: _buildText());
  }

  Widget _buildSolidButton() {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.zero,
      child: ElevatedButton(
        onPressed: widget.disabled == true
            ? null
            : widget.loading == true
                ? () {}
                : widget.onPressed,
        style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) {
          Color color = widget.disabled == true
              ? widget.disableBgColor != null
                  ? widget.disableBgColor!
                  : _base.disableColor!
              : widget.bgColor != null
                  ? widget.bgColor!
                  : widget.color!.value;
          return color;
        })),
        child: _buildText(),
      ),
    );
  }

  Widget _buildOutlineButton() {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.zero,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: widget.disabled == true ? _base.disableColor! : widget.outlinedColor ?? widget.color!.value),
          shape: RoundedRectangleBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.zero,
          ),
        ),
        onPressed: widget.disabled == true
            ? null
            : widget.loading == true
                ? () {}
                : widget.onPressed,
        child: _buildText(),
      ),
    );
  }

  Widget _getType() {
    switch (widget.type) {
      case ButtonVariant.outline:
        return _buildOutlineButton();
      case ButtonVariant.text:
        return _buildTextButton();
      default:
        return _buildSolidButton();
    }
  }

  double _getHeight() {
    switch (widget.size) {
      case ButtonSize.small:
        return _base.smallHeight!;
      case ButtonSize.medium:
        return _base.mediumHeight!;
      default:
        return _base.largeHeight!;
    }
  }

  TextStyle _getTextStyle(BuildContext context) {
    switch (widget.size) {
      case ButtonSize.small:
        return bodyCaption.copyWith(fontWeight: FontWeight.w500);
      case ButtonSize.medium:
        return bodyBodySm.copyWith(fontWeight: FontWeight.w500);
      default:
        return bodyBody.copyWith(fontWeight: FontWeight.w500);
    }
  }

  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width - 32;
    return Container(
      height: widget.buttonHeight ?? _getHeight(),
      width: widget.buttonWidth ?? btnWidth,
      child: _getType(),
    );
  }
}
