import 'package:intl/intl.dart';

class Util {
  static String formatMoney(double number) {
    final formatter = NumberFormat("#,##0", "en_US");
    return formatter.format(number).replaceAll(',', ' ');
  }
}
