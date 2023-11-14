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
}
