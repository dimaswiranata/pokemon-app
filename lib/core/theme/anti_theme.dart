import 'package:flutter/material.dart';
import 'package:nexus_app/core/index.dart';

AppColors colors(context) => Theme.of(context).extension<AppColors>()!;

ThemeData getAntiTheme(BuildContext context, bool isDarkTheme) {
  return ThemeData(
    extensions: <ThemeExtension<AppColors>>[
      // EXTENTION COLOR DICTIONARY
      AppColors(
        appColorPrimary: isDarkTheme ? primaryWhite : primaryWhite,
      ),
    ],

    /* GENERAL THEME PROPERTIES */
    // applyElevationOverlayColor,
    // cupertinoOverrideTheme,
    // extensions,
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: bodyBody.copyWith(fontWeight: FontWeight.w300, color: greyText),
        errorStyle: bodyCaption.copyWith(fontWeight: FontWeight.w300, color: error),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: border, width: 1.0),
          borderRadius: BorderRadius.circular(0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1.0),
          borderRadius: BorderRadius.circular(0.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: error, width: 1.0),
          borderRadius: BorderRadius.circular(0.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: error, width: 1.0),
          borderRadius: BorderRadius.circular(0.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: border, width: 1.0),
          borderRadius: BorderRadius.circular(0.0),
        )),
    // materialTapTargetSize,
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    // platform,
    // scrollbarTheme,
    // splashFactory,
    // useMaterial3,
    // visualDensity,
    // brightness: Brightness.light,
    // canvasColor,
    // cardColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      background: isDarkTheme ? backgroundDark : backgroundLight,
      primary: primaryColor,
      secondary: primaryColor,
    ),
    // colorSchemeSeed,
    // dialogBackgroundColor,
    // disabledColor,
    // dividerColor,
    // focusColor,
    // highlightColor,
    // hintColor,
    // hoverColor,
    // indicatorColor,
    // primaryColor,
    // primaryColorDark,
    // primaryColorLight,
    primarySwatch: swatchColor,
    scaffoldBackgroundColor: isDarkTheme ? backgroundDark : backgroundLight,
    // secondaryHeaderColor,
    // shadowColor,
    // splashColor,
    unselectedWidgetColor: primaryWhite,

    /* TYPOGRAPHY & ICONOGRAPHY */
    fontFamily: body,
    // fontFamilyFallback,
    // package,
    // iconTheme,
    // primaryIconTheme,
    // primaryTextTheme : TextTheme(),
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 57.0, fontFamily: body, color: primaryColor, fontWeight: FontWeight.w400),
      displayMedium: TextStyle(fontSize: 45.0, fontFamily: body, color: primaryColor, fontWeight: FontWeight.w400),
      displaySmall: TextStyle(fontSize: 36.0, fontFamily: body, color: primaryColor, fontWeight: FontWeight.w400),
      headlineLarge: TextStyle(fontSize: 32.0, fontFamily: body, color: primaryColor, fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(fontSize: 28.0, fontFamily: body, color: primaryColor, fontWeight: FontWeight.w400),
      headlineSmall: TextStyle(fontSize: 24.0, fontFamily: body, color: primaryColor, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(fontSize: 22.0, fontFamily: body, color: primaryColor, fontWeight: FontWeight.w400),
      titleMedium: TextStyle(fontSize: 16.0, fontFamily: body, color: primaryColor, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(fontSize: 14.0, fontFamily: body, color: primaryColor, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(fontSize: 14.0, fontFamily: body, color: primaryColor, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(fontSize: 12.0, fontFamily: body, color: primaryColor, fontWeight: FontWeight.w400),
      labelSmall: TextStyle(fontSize: 11.0, fontFamily: body, color: primaryColor, letterSpacing: 0.6, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(fontSize: 16.0, fontFamily: body, color: primaryColor, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 14.0, fontFamily: body, color: primaryColor, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 12.0, fontFamily: body, color: primaryColor, fontWeight: FontWeight.w400),
    ),
    // typography,

    /* COMPONENT THEMES */
    // appBarTheme,
    // badgeTheme,
    // bannerTheme,
    // bottomAppBarTheme,
    // bottomNavigationBarTheme,
    // bottomSheetTheme,
    // buttonBarTheme,
    // buttonTheme,
    // cardTheme,
    // checkboxTheme,
    // chipTheme,
    // dataTableTheme,
    // dialogTheme,
    // dividerTheme,
    // drawerTheme,
    // dropdownMenuTheme,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
      ),
    ),
    // expansionTileTheme,
    // filledButtonTheme,
    // floatingActionButtonTheme,
    // iconButtonTheme,
    // listTileTheme,
    // menuBarTheme,
    // menuButtonTheme,
    // menuTheme,
    // navigationBarTheme,
    // navigationDrawerTheme,
    // navigationRailTheme,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        side: BorderSide(
          color: primaryWhite.withOpacity(0.5),
        ),
      ),
    ),
    // popupMenuTheme,
    // progressIndicatorTheme,
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all<Color>(primaryColor),
    ),
    // segmentedButtonTheme,
    // sliderTheme,
    // snackBarTheme,
    // switchTheme,
    // tabBarTheme,
    // textButtonTheme,
    // textSelectionTheme,
    // timePickerTheme,
    // toggleButtonsTheme,
    // tooltipTheme,
  );
}

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color? appColorPrimary;

  const AppColors({
    required this.appColorPrimary,
  });

  @override
  AppColors copyWith({
    Color? appColorPrimary,
  }) {
    return AppColors(
      appColorPrimary: appColorPrimary ?? this.appColorPrimary,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      appColorPrimary: Color.lerp(appColorPrimary, other.appColorPrimary, t),
    );
  }
}
