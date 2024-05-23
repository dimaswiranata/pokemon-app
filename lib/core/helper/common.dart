import 'dart:developer' as developer;
import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:nexus_app/core/index.dart';
import 'package:url_launcher/url_launcher.dart';

class Ratio {
  final double? height, width;
  Ratio({this.height, this.width});
}

class Common {
  static Ratio calculateRatio(double width, {String? ratio}) {
    switch (ratio) {
      case '16:9':
        return Ratio(width: width, height: width * 0.5625);
      case '3:2':
        return Ratio(width: width, height: width * (2 / 3));
      case '2:1':
        return Ratio(width: width, height: width * 0.5);
      case '2:3':
        return Ratio(width: width, height: width * 1.5);
      case '3:4':
        return Ratio(width: width, height: width * (4 / 3));
      case '4:3':
        return Ratio(width: width, height: width * 0.75);
      case '3:1':
        return Ratio(width: width, height: width * (1 / 3));
      case '5:4':
        return Ratio(width: width, height: width * (4 / 5));
      default:
        return Ratio(width: width, height: width);
    }
  }

  static String? numberFormat(int? value, {String? locale, String? suffix}) {
    final formatCurrency = NumberFormat.currency(locale: locale ?? 'id_ID', symbol: '', decimalDigits: 0);
    return formatCurrency.format(value) + (suffix != null ? ' $suffix' : '');
  }

  static String getType(String type) {
    switch (type) {
      case 'DATE_SQL':
        return 'yyyy-MM-dd';
      case 'VERY_SHORT':
        return 'dd/MM/yyyy';
      case 'SHORT':
        return 'dd MMM yyyy';
      case 'LONG':
        return 'EEEE, dd MMMM yyyy';
      case 'MONTH_YEAR':
        return 'MMM yyyy';
      case 'DAY':
        return 'EEEE';
      case 'DATE':
        return 'dd';
      case 'MONTH':
        return 'MMMM';
      case 'TIME':
        return 'H:mm';
      case 'TIME_24':
        return 'HH:mm';
      case 'SHORT_WITH_TIME':
        return 'dd MMM yyyy • H:mm';
      case 'LONG_WITHOT_DAY':
        return 'dd MMMM yyyy';
      default:
        return '';
    }
  }

  static String? dateFormat(String value, String type) {
    DateTime dateTimeFromString = DateTime.parse(value);
    return DateFormat(getType(type)).format(dateTimeFromString);
  }

  static String parseUrlParams(Map<String, dynamic>? urlParams) {
    if (urlParams == null) return '';
    if (urlParams.isEmpty) return '';
    String combinedParams = '';
    for (String key in urlParams.keys) {
      if (combinedParams == '') {
        combinedParams = '?${key}=${urlParams[key]}';
      } else {
        combinedParams = '${combinedParams}&${key}=${urlParams[key]}';
      }
    }
    return combinedParams;
  }

  static String getImage(List<dynamic> imgList, String type) {
    for (Map<String, dynamic> img in imgList) {
      if (img['type'] == type) {
        return img['image3x'] ?? '';
      }
    }
    return '';
  }

  static List<ItemPicker> getGenderList() {
    return [
      ItemPicker(id: 0, title: 'Male', value: 'MALE'),
      ItemPicker(id: 1, title: 'Female', value: 'FEMALE'),
      ItemPicker(id: 2, title: 'Prefer not to say', value: 'OTHER'),
    ];
  }

  static String getGenderTitleByValue(value) {
    int index = getGenderList().indexWhere((p) => p.value == value);
    if (index != -1) {
      return getGenderList()[index].title!;
    }
    return '';
  }

  static String getGenderValueByTitle(title) {
    int index = getGenderList().indexWhere((p) => p.title == title);
    if (index != -1) {
      return getGenderList()[index].value!;
    }
    return '';
  }

  static String convertMtoKM(int? value) {
    double roundDistanceInKM = 0.0;
    if (value != null) {
      double distanceInMeters = value.toDouble();
      double distanceInKiloMeters = distanceInMeters / 10000000;
      roundDistanceInKM = double.parse((distanceInKiloMeters).toStringAsFixed(2));
    }

    return roundDistanceInKM.toString();
  }

  static double getDinamicBottomSize(BuildContext context) {
    double paddingBottom = MediaQuery.of(context).padding.bottom;
    return paddingBottom != 0 && Platform.isIOS ? paddingBottom + space.reg : space.lg;
  }

  static double getDinamicTopSize(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double getDinamicHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getDinamicWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static void printModel(dynamic model) {
    if (kDebugMode) inspect(model);
  }

  static void antiPrintInfo(String msg) {
    if (kDebugMode) developer.log('\x1B[34m$msg\x1B[0m');
  }

  static void antiPrintSuccess(String msg) {
    if (kDebugMode) developer.log('\x1B[32m$msg\x1B[0m');
  }

  static void antiPrintWarning(String msg) {
    if (kDebugMode) developer.log('\x1B[33m$msg\x1B[0m');
  }

  static void antiPrintError(String msg) {
    if (kDebugMode) developer.log('\x1B[31m$msg\x1B[0m');
  }

  static void popWithCount(BuildContext context, int count) {
    int counter = 0;
    Navigator.popUntil(context, (route) {
      return counter++ == count;
    });
  }

  static void launchURLwithDialog(BuildContext context, String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      // throw Exception('Could not launch $url');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: backgroundDark,
            title: Text(
              "Alert!",
              style: bodyH3.copyWith(fontWeight: FontWeight.w700),
            ),
            content: Text('Could not launch $url'),
          );
        },
      );
    }
  }

  static void launchTelWithDialog(BuildContext context, String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    canLaunchUrl(launchUri).then((bool result) async {
      if (result == true) {
        await launchUrl(launchUri);
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: backgroundDark,
              title: Text(
                "Alert!",
                style: bodyH3.copyWith(fontWeight: FontWeight.w700),
              ),
              content: Text('Could not launch $phoneNumber'),
            );
          },
        );
      }
    });
  }

  static String getLastSegmentFromUrl(String url) {
    Uri uri = Uri.parse(url);
    List<String> segments = uri.pathSegments;
    return segments.isNotEmpty ? segments[segments.length - 2] : '';
  }

  static Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255, // Alpha value (full opacity)
      random.nextInt(256), // Red value
      random.nextInt(256), // Green value
      random.nextInt(256), // Blue value
    );
  }

  static String capitalizeFirstChar(String input) {
    if (input.isEmpty) return input;

    return input.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

extension StringExtension on String {
  String toCapitalize() {
    if (isEmpty) {
      return '';
    }
    List<String> words = split(' ');
    List<String> capitalizedWords = words.map((word) {
      return word.substring(0, 1).toUpperCase() + word.substring(1);
    }).toList();
    return capitalizedWords.join(' ');
  }
}
