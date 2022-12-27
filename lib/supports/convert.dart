import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String numberToCurrency(num x, String symbol) {
  return '${NumberFormat.currency(locale: 'en_US', symbol: '', decimalDigits: 0).format(x)}$symbol';
}

String doubleToPercent(double x) {
  return '${(x * 100).toStringAsFixed(2)}%';
}

String dateToString(DateTime dateTime, String format) {
  return DateFormat(format).format(dateTime);
}

String timeToString(TimeOfDay timeOfDay) {
  return "${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}";
}