import 'package:crypto_wallet/data/models/currency.dart';
import 'package:flutter/material.dart';

class PopupMenuFilterCurrency extends StatefulWidget {
  final void Function(Currency) onSelected;
  const PopupMenuFilterCurrency({super.key, required this.onSelected});

  @override
  State<PopupMenuFilterCurrency> createState() =>
      _PopupMenuFilterCurrencyState();
}

class _PopupMenuFilterCurrencyState extends State<PopupMenuFilterCurrency> {
  Currency _selectedCurrency = Currency.BRL;

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
            value: currency.code,
            child: Text(
              '${currency.flagEmoji} ${currency.name}',
              style: TextStyle(color: Colors.white),
            ),
          );
        }).toList();
      },
      color: const Color(0xFF2A2A2A),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: const Color(0xFFFEB83D), width: 0.6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_selectedCurrency.flagEmoji} ${_selectedCurrency.name} (${_selectedCurrency.code})',
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            const Icon(Icons.arrow_drop_down, color: Color(0xFFFEB83D)),
          ],
        ),
      ),
    );
  }
}
