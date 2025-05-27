import 'package:intl/intl.dart';

extension CurrencyFormatter on String {
  String toCurrency(String symbol) {
    final value = double.tryParse(this);
    if (value == null) return this;

    return NumberFormat.currency(locale: 'pt_BR', symbol: symbol).format(value);
  }
}
