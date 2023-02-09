import 'package:intl/intl.dart';

String formatCurrency(num amount,
    {String? locale = "en_us", String? name = "USD", int decimalCount = 0}) {
  final formatCurrency = new NumberFormat.simpleCurrency(
      locale: locale, name: name, decimalDigits: decimalCount);
  return formatCurrency.format(amount);
}
