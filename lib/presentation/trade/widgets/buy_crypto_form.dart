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
  double btcPrice = 58947.22;
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
          showCursor: false,
          keyboardType: TextInputType.number,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.white,
            fontWeight: AppFontWeights.medium,
          ),
          decoration: InputDecoration(
            labelText: 'Qual valor deseja investir?',
            labelStyle: TextStyle(color: AppColors.grey),
            prefixText: 'BRL',
            hintText: ' 0,00',
            hintStyle: TextStyle(color: AppColors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey),
            ),
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
            _brlValue > 0.0
                ? Text(
                  'BTC  ${btcAmount.toStringAsFixed(8)}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                    fontWeight: AppFontWeights.medium,
                  ),
                )
                : SizedBox(),
          ],
        ),
      ],
    );
  }
}
