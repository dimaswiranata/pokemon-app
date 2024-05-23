import 'package:flutter/material.dart';

class AntiButtonStyle {
  double? smallHeight, mediumHeight, largeHeight;
  Color? disableColor, disableTextColor, disableFilledTextColor, solidTextButton, unsolidTextButton, solidLoading;

  AntiButtonStyle(
      {this.smallHeight,
      this.mediumHeight,
      this.largeHeight,
      this.disableColor,
      this.disableTextColor,
      this.disableFilledTextColor,
      this.solidTextButton,
      this.unsolidTextButton,
      this.solidLoading});
}

class AntiToastStyle {
  Color? errorBaseColor, warningBaseColor, successBaseColor, infoBaseColor, appBaseColor;

  Color? errorFilledBaseColor, warningFilledBaseColor, successFilledBaseColor, infoFilledBaseColor, appFilledBaseColor;

  Color? errorOutlineColor, warningOutlineColor, successOutlineColor, infoOutlineColor, appOutlineColor;

  Color? boxlessColor;

  Color? subtitleColor;

  Color? filledIconColor;

  AntiToastStyle({
    this.errorBaseColor,
    this.warningBaseColor,
    this.successBaseColor,
    this.infoBaseColor,
    this.appBaseColor,
    this.errorFilledBaseColor,
    this.warningFilledBaseColor,
    this.successFilledBaseColor,
    this.infoFilledBaseColor,
    this.appFilledBaseColor,
    this.errorOutlineColor,
    this.warningOutlineColor,
    this.successOutlineColor,
    this.infoOutlineColor,
    this.appOutlineColor,
    this.boxlessColor,
    this.subtitleColor,
    this.filledIconColor,
  });
}
