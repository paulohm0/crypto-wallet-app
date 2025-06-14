import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/data/currency.dart';
import 'package:flutter/material.dart';

class PopupMenuFilterCurrency extends StatefulWidget {
  final void Function(Currency) onSelected;
  final Currency initialCurrency;

  const PopupMenuFilterCurrency({
    super.key,
    required this.onSelected,
    this.initialCurrency = Currency.BRL,
  });

  @override
  State<PopupMenuFilterCurrency> createState() =>
      _PopupMenuFilterCurrencyState();
}

class _PopupMenuFilterCurrencyState extends State<PopupMenuFilterCurrency> {
  late Currency _selectedCurrency;

  @override
  void initState() {
    super.initState();
    _selectedCurrency = widget.initialCurrency;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      position: PopupMenuPosition.under,
      onSelected: (String value) {
        final currency = Currency.fromCode(value);
        if (currency != null) {
          setState(() {
            _selectedCurrency = currency;
          });
          widget.onSelected(currency);
        }
      },
      itemBuilder: (BuildContext context) {
        return Currency.values.map((currency) {
          return PopupMenuItem<String>(
            height: 30.0,
            value: currency.code,
            child: Text(
              '${currency.flagEmoji} ${currency.name}',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: AppFontSizes.sss,
              ),
            ),
          );
        }).toList();
      },
      color: AppColors.greyBackground,
      child: _buildButton(),
    );
  }

  Widget _buildButton() {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        color: AppColors.greyBackground,
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(color: AppColors.primary, width: 0.8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${_selectedCurrency.flagEmoji} ${_selectedCurrency.name} (${_selectedCurrency.code})',
            style: const TextStyle(
              color: AppColors.white,
              fontSize: AppFontSizes.ss,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.arrow_drop_down, color: AppColors.primary),
        ],
      ),
    );
  }
}
