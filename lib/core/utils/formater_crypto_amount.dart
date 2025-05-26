import 'package:intl/intl.dart';

extension BRLFormatter on String {
  String toBRLCurrency() {
    final amountFormatted = double.parse(this);
    final formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );
    return formatter.format(amountFormatted);
  }
}
