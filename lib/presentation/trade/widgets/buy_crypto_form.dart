import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';

class BuyCryptoForm extends StatefulWidget {
  const BuyCryptoForm({super.key});

  @override
  State<BuyCryptoForm> createState() => _BuyCryptoFormState();
}

class _BuyCryptoFormState extends State<BuyCryptoForm> {
  late final CurrencyTextFieldController _controller;
  double _brlValue = 0.0;
  double btcPrice = 58947.22; // exemplo: valor 1 BTC em BRL
  String? _error;

  @override
  void initState() {
    super.initState();
    _controller = CurrencyTextFieldController(
      currencySymbol: '',
      decimalSymbol: ',',
      thousandSymbol: '.',
      initDoubleValue: 0.00,
    );

    _controller.addListener(_updateValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateValue() {
    setState(() {
      _brlValue = _controller.doubleValue;
      _error = _brlValue < 10.0 ? 'Valor mínimo é R\$ 10,00' : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final btcAmount = _brlValue / btcPrice;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.white,
            fontWeight: AppFontWeights.medium,
          ),
          decoration: InputDecoration(
            labelText: 'Qual valor deseja investir?',
            prefixText: 'BRL',
            prefixStyle: TextStyle(
              color: AppColors.white,
              fontWeight: AppFontWeights.medium,
            ),
            errorText: _error,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Text(
              'BTC  ${btcAmount.toStringAsFixed(8)}',
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.white,
                fontWeight: AppFontWeights.medium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
