import 'package:intl/intl.dart';

extension IDateTimeExtensions on DateTime {
  String iDateNumber() {
    return DateFormat("dd-MM-yyyy").format(this);
  }

  String iDateName() {
    return DateFormat("dd-MMM-yyyy").format(this);
  }

  String iDateDDMMMMYYYY() {
    return DateFormat("dd MMMM yyyy").format(this);
  }

  String get iDateFormatDDMMYYYY {
    return DateFormat("dd/MM/yyyy").format(this);
  }

  String get iDateFormatMMYYY {
    return DateFormat("MM/yyyy").format(this);
  }

  String get iDateFormatMMMYYYY {
    return DateFormat("MMM yyyy").format(this);
  }

  String get iDateDD {
    return DateFormat("dd").format(this);
  }

  String get iDateMM {
    return DateFormat("MM").format(this);
  }

  String get iDateMMM {
    return DateFormat("MMM").format(this);
  }

  String get iDateMMMM {
    return DateFormat("MMMM").format(this);
  }

  String get iDateYYYY {
    return DateFormat("yyyy").format(this);
  }

  String get complete {
    return DateFormat("dd/MM/yyyy HH:mm:ss").format(this);
  }

  String get iDateTimeHm {
    return DateFormat("dd/MM/yyyy HH:mm").format(this);
  }

  String get iDateTimezone {
    return DateFormat("dd/MM/yyyy HH:mm zzz").format(this);
  }

  String get iHumans {
    return DateFormat("dd MMM yyyy").format(this);
  }

  String get iDayDate {
    return DateFormat("EE, dd MMM").format(this);
  }

  String get iDateMonthSimple {
    return DateFormat("dd MMM").format(this);
  }

  String get iyyyMMdd {
    return DateFormat("yyyy-MM-dd").format(this);
  }

  String get iEEEDDMMMYYYY {
    return DateFormat('EEEE, dd MMMM yyyy', 'id').format(this);
  }
}

extension IDateTimeEpochExtensions on int {
  String iDateNumber() {
    return DateFormat("dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(this));
  }

  String iDateName() {
    return DateFormat("dd-MMM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(this));
  }

  String get iDateFormatDDMMYYYY {
    return DateFormat("dd/MM/yyyy").format(DateTime.fromMillisecondsSinceEpoch(this));
  }

  String get iDateDD {
    return DateFormat("dd").format(DateTime.fromMillisecondsSinceEpoch(this));
  }

  String get iDateMM {
    return DateFormat("MM").format(DateTime.fromMillisecondsSinceEpoch(this));
  }

  String get iDateMMM {
    return DateFormat("MMM").format(DateTime.fromMillisecondsSinceEpoch(this));
  }

  String get iDateYYYY {
    return DateFormat("yyyy").format(DateTime.fromMillisecondsSinceEpoch(this));
  }

  String get iDateDDMM {
    return DateFormat("dd/MM").format(DateTime.fromMillisecondsSinceEpoch(this));
  }

  String get complete {
    return DateFormat("dd/MM/yyyy HH:mm:ss").format(DateTime.fromMillisecondsSinceEpoch(this));
  }

  String get iDateTimezone {
    return DateFormat("dd/MM/yyyy HH:mm zzz").format(DateTime.fromMillisecondsSinceEpoch(this));
  }

  /// Convert int month to format string two digits
  ///
  /// Example : Januari => 1 to "01"
  String get intToTwoDigitString {
    // Convert the integer to a string
    String numStr = toString();

    // If the number has more than two digits, truncate it to two digits
    if (numStr.length > 2) {
      numStr = numStr.substring(numStr.length - 2);
    }

    // If the number has less than two digits, pad it with leading zeros to make it two digits long
    while (numStr.length < 2) {
      numStr = "0$numStr";
    }

    return numStr;
  }
}

extension IDateIso860Extension on String {
  String get iso860toDDMMYYYYHHSS {
    try {
      final dateTime = DateTime.parse(this).toLocal();
      final formatter = DateFormat('dd/MM/yyyy HH:mm \'WIB\'');
      return formatter.format(dateTime);
    } catch (e) {
      return '-';
    }
  }

  String get iso860toDDMMYYYY {
    try {
      final dateTime = DateTime.parse(this).toLocal();
      final formatter = DateFormat('dd/MM/yyyy');
      return formatter.format(dateTime);
    } catch (e) {
      return '-';
    }
  }

  String get iso860toEEEDDMMMYY {
    try {
      final dateTime = DateTime.parse(this).toLocal();
      final formatter = DateFormat('EEE, dd MMM yy');
      return formatter.format(dateTime);
    } catch (e) {
      return '-';
    }
  }

  String get iso860toEEEEDDMMMYY {
    try {
      final dateTime = DateTime.parse(this).toLocal();
      final formatter = DateFormat('EEEE, dd MMM yyyy');
      return formatter.format(dateTime);
    } catch (e) {
      return '-';
    }
  }

  String get iso860toEEEEDDMMMMYY {
    try {
      final dateTime = DateTime.parse(this).toLocal();
      final formatter = DateFormat('EEEE, dd MMMM yyyy');
      return formatter.format(dateTime);
    } catch (e) {
      return '-';
    }
  }

  String get iso860toDDMMMMYYYY {
    try {
      final dateTime = DateTime.parse(this).toLocal();
      final formatter = DateFormat('dd MMMM yyyy');
      return formatter.format(dateTime);
    } catch (e) {
      return '-';
    }
  }

  String get iso860toMM {
    try {
      final dateTime = DateTime.parse(this).toLocal();
      final formatter = DateFormat('MM');
      return formatter.format(dateTime);
    } catch (e) {
      return '-';
    }
  }

  String get iso860toD {
    try {
      final dateTime = DateTime.parse(this).toLocal();
      final formatter = DateFormat('d');
      return formatter.format(dateTime);
    } catch (e) {
      return '-';
    }
  }
}
