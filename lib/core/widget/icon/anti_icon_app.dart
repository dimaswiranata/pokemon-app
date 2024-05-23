// Place fonts/icomoon.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: icomoon
//      fonts:
//       - asset: fonts/AntiIconApp.ttf
import 'package:flutter/widgets.dart';

class AntiIconApp {
  AntiIconApp._();

  static const String _fontFamily = 'AntiIconApp';

  static Map<String, IconData> _iconsMap = {
    "app_arrow_big_down": const IconData(0xe900, fontFamily: _fontFamily),
    "app_arrow_big_left": const IconData(0xe901, fontFamily: _fontFamily),
    "app_arrow_big_right": const IconData(0xe902, fontFamily: _fontFamily),
    "app_arrow_big_up": const IconData(0xe903, fontFamily: _fontFamily),
    "app_arrow_down": const IconData(0xe904, fontFamily: _fontFamily),
    "app_arrow_left": const IconData(0xe905, fontFamily: _fontFamily),
    "app_arrow_right": const IconData(0xe906, fontFamily: _fontFamily),
    "app_arrow_up": const IconData(0xe907, fontFamily: _fontFamily),
    "app_bank": const IconData(0xe908, fontFamily: _fontFamily),
    "app_calendar": const IconData(0xe909, fontFamily: _fontFamily),
    "app_camera": const IconData(0xe90a, fontFamily: _fontFamily),
    "app_check": const IconData(0xe90b, fontFamily: _fontFamily),
    "app_close": const IconData(0xe90c, fontFamily: _fontFamily),
    "app_copy": const IconData(0xe90d, fontFamily: _fontFamily),
    "app_credit_card": const IconData(0xe90e, fontFamily: _fontFamily),
    "app_emoticon": const IconData(0xe90f, fontFamily: _fontFamily),
    "app_filter": const IconData(0xe910, fontFamily: _fontFamily),
    "app_find_match": const IconData(0xe911, fontFamily: _fontFamily),
    "app_flag": const IconData(0xe912, fontFamily: _fontFamily),
    "app_gallery": const IconData(0xe913, fontFamily: _fontFamily),
    "app_gift": const IconData(0xe914, fontFamily: _fontFamily),
    "app_heart": const IconData(0xe915, fontFamily: _fontFamily),
    "app_history": const IconData(0xe916, fontFamily: _fontFamily),
    "app_hw_live": const IconData(0xe917, fontFamily: _fontFamily),
    "app_inbox": const IconData(0xe918, fontFamily: _fontFamily),
    "app_location": const IconData(0xe919, fontFamily: _fontFamily),
    "app_lock": const IconData(0xe91a, fontFamily: _fontFamily),
    "app_meatball": const IconData(0xe91b, fontFamily: _fontFamily),
    "app_money": const IconData(0xe91c, fontFamily: _fontFamily),
    "app_package": const IconData(0xe91d, fontFamily: _fontFamily),
    "app_person": const IconData(0xe91e, fontFamily: _fontFamily),
    "app_plus": const IconData(0xe91f, fontFamily: _fontFamily),
    "app_qr_code": const IconData(0xe920, fontFamily: _fontFamily),
    "app_radio_off": const IconData(0xe921, fontFamily: _fontFamily),
    "app_radio_on": const IconData(0xe922, fontFamily: _fontFamily),
    "app_replace": const IconData(0xe924, fontFamily: _fontFamily),
    "app_seat": const IconData(0xe925, fontFamily: _fontFamily),
    "app_send": const IconData(0xe926, fontFamily: _fontFamily),
    "app_share": const IconData(0xe927, fontFamily: _fontFamily),
    "app_sign_out": const IconData(0xe928, fontFamily: _fontFamily),
    "app_sort_alt": const IconData(0xe929, fontFamily: _fontFamily),
    "app_sort": const IconData(0xe92a, fontFamily: _fontFamily),
    "app_time": const IconData(0xe92b, fontFamily: _fontFamily),
    "app_view_list": const IconData(0xe92c, fontFamily: _fontFamily),
    "app_view_map": const IconData(0xe92d, fontFamily: _fontFamily),
    "app_wallet": const IconData(0xe92e, fontFamily: _fontFamily),
  };

  // Custom method to get IconData based on the icon name
  static IconData getIcon(String iconName) {
    return _iconsMap[iconName] ?? const IconData(0xe901, fontFamily: _fontFamily);
  }

  // Custom method to get a list of all icon names
  static List<String> getAllIconNames() {
    return _iconsMap.keys.toList();
  }

  // Custom method to get a list of all IconDatas
  static List<IconData> getAllIcons() {
    return _iconsMap.values.toList();
  }
}
