import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Currency {
  static String currency(BuildContext context) {
    return NumberFormat.simpleCurrency(locale: "RU").currencySymbol.toString();
  }
}
