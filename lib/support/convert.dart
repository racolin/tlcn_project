import 'package:intl/intl.dart';

String numberToCurrency(num x) {
  return NumberFormat.compactLong(locale: 'en_US').format(x);
}

String doubleToPercent(double x) {
  return '${(x * 100).toStringAsFixed(2)}%';
}