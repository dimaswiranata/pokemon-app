import 'package:flutter/material.dart';

import 'package:nexus_app/core/index.dart';

AntiButtonStyle buttonStyle = AntiButtonStyle(
    smallHeight: 36.0,
    mediumHeight: 44.0,
    largeHeight: 52.0,
    disableColor: disable,
    disableTextColor: disable,
    disableFilledTextColor: primaryWhite,
    solidTextButton: primaryWhite,
    solidLoading: primaryWhite);

AntiToastStyle toastStyle = AntiToastStyle(
    filledIconColor: Colors.black,
    errorBaseColor: Color(0xFFFF470D),
    warningBaseColor: Color(0xFFE59E1D),
    successBaseColor: Color(0xFF0DFFC5),
    infoBaseColor: Color(0xFF2E5CE5),
    appBaseColor: primaryColor,
    errorFilledBaseColor: Colors.white,
    warningFilledBaseColor: Colors.black,
    successFilledBaseColor: Colors.black,
    infoFilledBaseColor: Colors.black,
    appFilledBaseColor: Colors.white,
    errorOutlineColor: Color(0xFFFAECEC),
    warningOutlineColor: Color(0xFFFFF7E9),
    successOutlineColor: Color(0xFFEEF8F4),
    infoOutlineColor: Color(0xFFEBF0FF),
    appOutlineColor: Color.fromARGB(255, 254, 252, 247),
    boxlessColor: Colors.white,
    subtitleColor: Color(0xFF1A1A1A).withOpacity(0.6));
