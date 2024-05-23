import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:nexus_app/core/index.dart';

class Info {
  static void showAntiToast(BuildContext context, ToastType type,
      {String? title,
      String? subtitle,
      void Function()? onTap,
      void Function()? onClose,
      ToastVariant variant = ToastVariant.filled,
      double? rounded,
      bool showClose = true,
      Widget? left,
      Widget? right,
      Widget? center,
      TextStyle? titleStyle,
      TextStyle? subTitleStyle,
      ToastPosition? position,
      int? duration}) {
    FToast().init(context);
    FToast().showToast(
      positionedToastBuilder: (context, child) {
        double topPadding = MediaQuery.of(context).padding.top;
        double bottomPadding = MediaQuery.of(context).padding.bottom;
        if (position == ToastPosition.BOTTOM) {
          return Positioned(right: space.reg, left: space.reg, bottom: bottomPadding + space.xl, child: child);
        } else if (position == ToastPosition.SNACKBAR) {
          return Positioned(right: space.none, left: space.none, bottom: space.none, child: child);
        }
        return Positioned(right: space.reg, left: space.reg, top: topPadding + space.xl, child: child);
      },
      child: AntiToast(
          onClose: () => onClose ?? FToast().removeCustomToast(),
          title: title ?? '',
          subtitle: subtitle ?? '',
          onTap: onTap,
          type: type,
          variant: variant,
          rounded: rounded ?? radius.md,
          showClose: showClose,
          titleStyle: titleStyle,
          subTitleStyle: subTitleStyle,
          left: left,
          right: right,
          center: center),
      // gravity: position != null ? position.value : ToastGravity.TOP,
      toastDuration: Duration(seconds: duration ?? 3),
    );
  }

  static void removeAntiToast() {
    FToast().removeCustomToast();
  }

  static void showAntiDialog(BuildContext context,
      {String? image,
      String? title,
      TextStyle? titleStyle,
      String? subtitle,
      TextStyle? subtitleStyle,
      void Function()? onSuccess,
      void Function()? onFailed,
      Widget? action}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AntiDialog(
          image: image,
          title: title,
          titleStyle: titleStyle,
          subtitle: subtitle,
          subtitleStyle: subtitleStyle,
          onFailed: onFailed,
          onSuccess: onSuccess,
          action: action,
        );
      },
    );
  }

  static void showAntiPicker(BuildContext context, {String? title, List<ItemPicker>? data, void Function(ItemPicker)? onSelect}) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return AntiPicker(title: title, data: data, onSelect: onSelect);
        });
  }

  static void adaptiveTimePicker(BuildContext context, {required DateTime initialTime, void Function(DateTime)? onChangeTime}) {
    if (Platform.isIOS) {
      showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) => Container(
                height: 300,
                padding: const EdgeInsets.only(top: 6.0),
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                color: CupertinoColors.systemBackground.resolveFrom(context),
                child: SafeArea(
                  top: false,
                  child: CupertinoDatePicker(
                    initialDateTime: initialTime,
                    use24hFormat: true,
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: onChangeTime ?? (DateTime newDateTime) {},
                  ),
                ),
              ));
    } else {
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialTime),
        builder: (context, child) {
          return Theme(
            child: child!,
            data: Theme.of(context).copyWith(
              primaryColor: Colors.black,
              dialogBackgroundColor: Colors.black,
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: primaryWhite, // button text color
                ),
              ),
              primaryTextTheme: TextTheme(bodySmall: TextStyle(color: primaryWhite)),
              textTheme: TextTheme(bodySmall: TextStyle(color: primaryWhite)),
              bottomAppBarTheme: BottomAppBarTheme(color: primaryColor),
              colorScheme: ColorScheme.dark(
                primary: primaryWhite, // <-- SEE HERE
                onPrimary: primaryWhite, // <-- SEE HERE
                onSurface: primaryColor,
                primaryContainer: primaryWhite,
                onPrimaryContainer: primaryWhite,
              ).copyWith(background: primaryColor),
            ),
          );
        },
      ).then(
        (value) => {
          if (onChangeTime != null && value != null)
            {
              onChangeTime(
                DateTime(
                  DateTime.now().day,
                  DateTime.now().month,
                  DateTime.now().day,
                  value.hour,
                  value.minute,
                ),
              ),
            }
        },
      );
    }
  }

  static void adaptiveDatePicker(BuildContext context,
      {required DateTime initialDate, required DateTime maximumDate, void Function(DateTime)? onChangeDate}) {
    if (Platform.isIOS) {
      showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) => Container(
                height: 300,
                padding: const EdgeInsets.only(top: 6.0),
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                color: CupertinoColors.systemBackground.resolveFrom(context),
                child: SafeArea(
                  top: false,
                  child: CupertinoDatePicker(
                    initialDateTime: initialDate,
                    maximumDate: maximumDate,
                    minimumDate: DateTime(1970),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: onChangeDate ?? (DateTime newDateTime) {},
                  ),
                ),
              ));
    } else {
      showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1970),
        lastDate: maximumDate,
        // builder: (context, child) {
        //   return Theme(
        //     child: child!,
        //     data: Theme.of(context).copyWith(
        //       primaryColor: Colors.black,
        //       dialogBackgroundColor: Colors.black,
        //       textButtonTheme: TextButtonThemeData(
        //         style: TextButton.styleFrom(
        //           foregroundColor: Colors.white, // button text color
        //         ),
        //       ),
        //       primaryTextTheme: TextTheme(bodySmall: TextStyle(color: primaryWhite)),
        //       textTheme: TextTheme(bodySmall: TextStyle(color: primaryWhite)),
        //       bottomAppBarTheme: BottomAppBarTheme(color: primaryColor),
        //       colorScheme: ColorScheme.light(
        //         primary: primaryColor, // <-- SEE HERE
        //         onPrimary: Colors.black, // <-- SEE HERE
        //         onSurface: primaryWhite,
        //         primaryContainer: primaryColor,
        //         onPrimaryContainer: primaryColor,
        //       ).copyWith(background: primaryColor),
        //     ),
        //   );
        // },
      ).then((value) => {
            if (onChangeDate != null && value != null) {onChangeDate(value)}
          });
    }
  }
}

class Toast {
  static void showError(BuildContext context,
      {String? title,
      String? subtitle,
      void Function()? onTap,
      void Function()? onClose,
      ToastVariant variant = ToastVariant.filled,
      double? rounded,
      bool showClose = true,
      Widget? left,
      Widget? right,
      Widget? center,
      ToastPosition? position,
      TextStyle? titleStyle,
      TextStyle? subTitleStyle,
      int? duration}) {
    Info.showAntiToast(context, ToastType.ERROR,
        title: title,
        subtitle: subtitle,
        onTap: onTap,
        onClose: onClose,
        variant: variant,
        rounded: rounded,
        showClose: showClose,
        left: left,
        right: right,
        titleStyle: titleStyle,
        subTitleStyle: subTitleStyle,
        center: center,
        position: position,
        duration: duration);
  }

  static void showInfo(BuildContext context,
      {String? title,
      String? subtitle,
      void Function()? onTap,
      void Function()? onClose,
      ToastVariant variant = ToastVariant.filled,
      double? rounded,
      bool showClose = true,
      Widget? left,
      Widget? right,
      Widget? center,
      TextStyle? titleStyle,
      TextStyle? subTitleStyle,
      ToastPosition? position,
      int? duration}) {
    Info.showAntiToast(context, ToastType.INFO,
        title: title,
        subtitle: subtitle,
        onTap: onTap,
        onClose: onClose,
        variant: variant,
        rounded: rounded,
        showClose: showClose,
        left: left,
        right: right,
        center: center,
        titleStyle: titleStyle,
        subTitleStyle: subTitleStyle,
        position: position,
        duration: duration);
  }

  static void showApp(BuildContext context,
      {String? title,
      String? subtitle,
      void Function()? onTap,
      void Function()? onClose,
      ToastVariant variant = ToastVariant.filled,
      double? rounded,
      bool showClose = true,
      Widget? left,
      Widget? right,
      Widget? center,
      TextStyle? titleStyle,
      TextStyle? subTitleStyle,
      ToastPosition? position,
      int? duration}) {
    Info.showAntiToast(context, ToastType.APP,
        title: title,
        subtitle: subtitle,
        onTap: onTap,
        onClose: onClose,
        variant: variant,
        rounded: rounded,
        showClose: showClose,
        left: left,
        right: right,
        center: center,
        titleStyle: titleStyle,
        subTitleStyle: subTitleStyle,
        position: position,
        duration: duration);
  }

  static void showSuccess(BuildContext context,
      {String? title,
      String? subtitle,
      void Function()? onTap,
      void Function()? onClose,
      ToastVariant variant = ToastVariant.filled,
      double? rounded,
      bool showClose = true,
      Widget? left,
      Widget? right,
      Widget? center,
      TextStyle? titleStyle,
      TextStyle? subTitleStyle,
      ToastPosition? position,
      int? duration}) {
    Info.showAntiToast(context, ToastType.SUCCESS,
        title: title,
        subtitle: subtitle,
        onTap: onTap,
        onClose: onClose,
        variant: variant,
        rounded: rounded,
        showClose: showClose,
        left: left,
        titleStyle: titleStyle,
        subTitleStyle: subTitleStyle,
        right: right,
        center: center,
        position: position,
        duration: duration);
  }

  static void showWarning(BuildContext context,
      {String? title,
      String? subtitle,
      void Function()? onTap,
      void Function()? onClose,
      ToastVariant variant = ToastVariant.filled,
      double? rounded,
      bool showClose = true,
      Widget? left,
      Widget? right,
      Widget? center,
      TextStyle? titleStyle,
      TextStyle? subTitleStyle,
      ToastPosition? position,
      int? duration}) {
    Info.showAntiToast(context, ToastType.WARNING,
        title: title,
        subtitle: subtitle,
        onTap: onTap,
        onClose: onClose,
        variant: variant,
        rounded: rounded,
        showClose: showClose,
        left: left,
        titleStyle: titleStyle,
        subTitleStyle: subTitleStyle,
        right: right,
        center: center,
        position: position,
        duration: duration);
  }

  static void removeAntiToast() {
    Info.removeAntiToast();
  }
}
