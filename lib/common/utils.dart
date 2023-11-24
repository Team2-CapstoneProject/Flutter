import 'package:intl/intl.dart';

class Utils {
  ///input parameter value int, output a String.
  ///
  ///example: 100000 -> 'Rp 100.000'
  static String currencyFormat(int value) {
    final NumberFormat numberFormat = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    String x = numberFormat.format(value);
    return x;
  }

  /// Input parameter value int, output a String.
  ///
  /// example: 375000 -> 'Rp 375,000'
  static String currencyFormat2(int value) {
    final NumberFormat numberFormat = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    String x = numberFormat.format(value).replaceAll('.', ',');
    return x;
  }

  ///input paramter value DateTime, output a String.
  ///
  ///example: DateTime.now() -> 'Des 12'
  static String dateTimeFormat2(DateTime dateTime) {
    return DateFormat('MMM d', 'id_ID').format(dateTime);
  }

  ///input paramter value DateTime, output a String.
  ///
  ///example: DateTime.now() -> 'Des 12, 2022'
  static String dateTimeFormat3(DateTime dateTime) {
    return DateFormat('MMM d, y', 'id_ID').format(dateTime);
  }

  /// Input parameter value DateTime, output a String.
  ///
  /// Example: DateTime.now() -> 'December 07, 2022'
  static String dateTimeFormat4(DateTime dateTime) {
    return DateFormat('MMMM dd, y', 'en_US').format(dateTime);
  }

  /// Input parameter value DateTime, output a String.
  ///
  /// Example: DateTime.now() -> '2023-09-19'
  static String dateTimeFormat5(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  /// Input parameter value DateTime, output a String.
  ///
  /// Example: DateTime.now() -> '19-09-2023 16:43'
  static String dateTimeFormatCustom(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy HH:mm').format(dateTime);
  }
}
