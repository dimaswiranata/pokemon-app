import 'package:intl/intl.dart';

class Format {
  static String? number(int value, [int decimal = 0]) {
    final number = NumberFormat.decimalPercentPattern(locale: null, decimalDigits: decimal);
    return number.format(value);
  }

  static String? currency(int value, {String symbol = '', int decimal = 0, String locale = "id"}) {
    final number = NumberFormat.currency(locale: locale, decimalDigits: decimal, symbol: symbol);
    return number.format(value);
  }

  static String? dateTime(String value, EnumDateTime type) {
    if (value.isEmpty) return '';
    DateTime convertedDate = DateTime.parse(value);
    return DateFormat(type.value).format(convertedDate);
  }

  static String phoneNumber(String phone) {
    return "${phone.substring(0, 3)} ${phone.substring(3, 6)} ${phone.substring(6, 10)} ${phone.substring(10, phone.length)}";
  }
}

enum EnumDateTime {
  day,
  shortDay,
  dateDay,
  month,
  shortMonth,
  year,
  hours,
  minutes,
  time1,
  time2,
  time3,
  dateShort1,
  dateShort2,
  dateShort3,
  dateShort4,
  dateShort5,
  dateShort6,
  dateShort7,
  dateLong1,
  dateLong2,
  dateLong3,
  dateLong4,
  dateLong5,
  dateTime1,
  dateTime2
}

extension EnumDateTimeExtension on EnumDateTime {
  String get value {
    switch (this) {
      case EnumDateTime.day:
        return 'EEEE';
      case EnumDateTime.shortDay:
        return 'EEE';
      case EnumDateTime.dateDay:
        return 'dd';
      case EnumDateTime.month:
        return 'MMMM';
      case EnumDateTime.shortMonth:
        return 'MMM';
      case EnumDateTime.year:
        return 'yyyy';
      case EnumDateTime.hours:
        return 'HH';
      case EnumDateTime.minutes:
        return 'mm';
      case EnumDateTime.time1:
        return 'H:mm';
      case EnumDateTime.time2:
        return 'HH:mm';
      case EnumDateTime.time3:
        return 'H:mm a';
      case EnumDateTime.dateShort1:
        return 'dd/MM/yyyy';
      case EnumDateTime.dateShort2:
        return 'dd MMM yyyy';
      case EnumDateTime.dateShort3:
        return 'dd MMMM yyyy';
      case EnumDateTime.dateShort4:
        return 'dd-MM-yyyy';
      case EnumDateTime.dateShort5:
        return 'MMMM yyyy';
      case EnumDateTime.dateShort6:
        return 'dd MMMM `yy';
      case EnumDateTime.dateShort7:
        return 'MMM yyyy';
      case EnumDateTime.dateLong1:
        return 'EEEE, dd MMMM yyyy';
      case EnumDateTime.dateLong2:
        return 'dd MMMM yyyy, EEEE';
      case EnumDateTime.dateLong3:
        return 'EEE, dd MMMM yyyy';
      case EnumDateTime.dateLong4:
        return 'dd MMM yyyy, HH:mm';
      case EnumDateTime.dateLong5:
        return 'EEE, dd MMM yyyy';
      case EnumDateTime.dateTime1:
        return 'dd MMM yyyy • H:mm';
      case EnumDateTime.dateTime2:
        return 'dd, MMM yyyy • H:mm';
    }
  }
}
