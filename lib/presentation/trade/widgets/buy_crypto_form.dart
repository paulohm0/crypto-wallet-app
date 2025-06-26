import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:crypto_wallet/presentation/info_crypto/view/info_crypto_view.dart';
import 'package:crypto_wallet/presentation/trade/view_model/trade_view_model.dart';
import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';

class BuyCryptoForm extends StatefulWidget {
  final TradeArguments tradeInformation;
  final CurrencyTextFieldController controller;
  final double cryptoAmount;
  final TradeViewModel viewModel;
  final String? errorFieldValue;
  const BuyCryptoForm({
    super.key,
    required this.tradeInformation,
    required this.controller,
    required this.cryptoAmount,
    required this.errorFieldValue,
    required this.viewModel,
  });

  @override
  State<BuyCryptoForm> createState() => _BuyCryptoFormState();
}

class _BuyCryptoFormState extends State<BuyCryptoForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          showCursor: false,
          keyboardType: TextInputType.number,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.white,
            fontWeight: AppFontWeights.medium,
          ),
          decoration: InputDecoration(
            labelText: widget.viewModel.inputLabel,
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
            errorText: widget.errorFieldValue,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            widget.viewModel.isValidFieldCrypto(widget.controller)
                ? Text(
                  '${widget.tradeInformation.cryptoArgs.crypto.symbol} ${widget.cryptoAmount.toStringAsFixed(6)}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                    fontWeight: AppFontWeights.medium,
                  ),
                )
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
