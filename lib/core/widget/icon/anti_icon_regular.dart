// Place fonts/AntiIconRegular.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: AntiIconRegular
//      fonts:
//       - asset: fonts/AntiIconRegular.ttf
import 'package:flutter/widgets.dart';

class AntiIconRegular {
  AntiIconRegular._();

  static const String _fontFamily = 'AntiIconRegular';

  static Map<String, IconData> _iconsMap = {
    'commerce_ticket': const IconData(0xe900, fontFamily: _fontFamily),
    'commerce_tag': const IconData(0xe901, fontFamily: _fontFamily),
    'commerce_tag_alt': const IconData(0xe902, fontFamily: _fontFamily),
    'commerce_package': const IconData(0xe903, fontFamily: _fontFamily),
    'commerce_pizza': const IconData(0xe904, fontFamily: _fontFamily),
    'commerce_popcorn': const IconData(0xe905, fontFamily: _fontFamily),
    'commerce_egg': const IconData(0xe906, fontFamily: _fontFamily),
    'commerce_cookie': const IconData(0xe907, fontFamily: _fontFamily),
    'commerce_birthday_cake': const IconData(0xe908, fontFamily: _fontFamily),
    'commerce_burger': const IconData(0xe909, fontFamily: _fontFamily),
    'commerce_buildings': const IconData(0xe90a, fontFamily: _fontFamily),
    'commerce_store_front': const IconData(0xe90b, fontFamily: _fontFamily),
    'commerce_beer_bottle': const IconData(0xe90c, fontFamily: _fontFamily),
    'commerce_wine': const IconData(0xe90d, fontFamily: _fontFamily),
    'commerce_martini': const IconData(0xe90e, fontFamily: _fontFamily),
    'commerce_brandy': const IconData(0xe90f, fontFamily: _fontFamily),
    'commerce_coffee': const IconData(0xe910, fontFamily: _fontFamily),
    'commerce_korean_won': const IconData(0xe911, fontFamily: _fontFamily),
    'commerce_chinese_yuan': const IconData(0xe912, fontFamily: _fontFamily),
    'commerce_japanese_yen': const IconData(0xe913, fontFamily: _fontFamily),
    'commerce_ethereum': const IconData(0xe914, fontFamily: _fontFamily),
    'commerce_bitcoin': const IconData(0xe915, fontFamily: _fontFamily),
    'commerce_us_dollar_coin': const IconData(0xe916, fontFamily: _fontFamily),
    'commerce_pounds': const IconData(0xe917, fontFamily: _fontFamily),
    'commerce_euro': const IconData(0xe918, fontFamily: _fontFamily),
    'commerce_us_dollar_alt': const IconData(0xe919, fontFamily: _fontFamily),
    'commerce_us_dollar': const IconData(0xe91a, fontFamily: _fontFamily),
    'commerce_cooking_pot': const IconData(0xe91b, fontFamily: _fontFamily),
    'commerce_utensils': const IconData(0xe91c, fontFamily: _fontFamily),
    'commerce_barcode': const IconData(0xe91d, fontFamily: _fontFamily),
    'commerce_receipt': const IconData(0xe91e, fontFamily: _fontFamily),
    'commerce_glasses': const IconData(0xe91f, fontFamily: _fontFamily),
    'commerce_t_shirt': const IconData(0xe920, fontFamily: _fontFamily),
    'commerce_factory': const IconData(0xe921, fontFamily: _fontFamily),
    'commerce_double_coin': const IconData(0xe922, fontFamily: _fontFamily),
    'commerce_vertical': const IconData(0xe923, fontFamily: _fontFamily),
    'commerce_coin_horizontal': const IconData(0xe924, fontFamily: _fontFamily),
    'commerce_money': const IconData(0xe925, fontFamily: _fontFamily),
    'commerce_cardholder': const IconData(0xe926, fontFamily: _fontFamily),
    'commerce_credit_card': const IconData(0xe927, fontFamily: _fontFamily),
    'commerce_wallet': const IconData(0xe928, fontFamily: _fontFamily),
    'commerce_shopping_cart_alt': const IconData(0xe929, fontFamily: _fontFamily),
    'commerce_shopping_cart': const IconData(0xe92a, fontFamily: _fontFamily),
    'commerce_tote': const IconData(0xe92b, fontFamily: _fontFamily),
    'commerce_handbag': const IconData(0xe92c, fontFamily: _fontFamily),
    'commerce_tote_alt': const IconData(0xe92d, fontFamily: _fontFamily),
    'commerce_shopping_bag': const IconData(0xe92e, fontFamily: _fontFamily),
    'commerce_gift': const IconData(0xe92f, fontFamily: _fontFamily),
    'commerce_binocular': const IconData(0xe930, fontFamily: _fontFamily),
    'commerce_lamp': const IconData(0xe931, fontFamily: _fontFamily),
    'commerce_coat_hanger': const IconData(0xe932, fontFamily: _fontFamily),
    'commerce_shower': const IconData(0xe933, fontFamily: _fontFamily),
    'commerce_rug': const IconData(0xe934, fontFamily: _fontFamily),
    'commerce_bathub': const IconData(0xe935, fontFamily: _fontFamily),
    'commerce_briefcase': const IconData(0xe936, fontFamily: _fontFamily),
  };

  // Custom method to get IconData based on the icon name
  static IconData getIcon(String iconName) {
    return _iconsMap[iconName] ?? const IconData(0xe900, fontFamily: _fontFamily);
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
