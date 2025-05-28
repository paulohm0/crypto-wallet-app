import 'package:crypto_wallet/data/models/currency.dart';
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

  Widget _buildButton() {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(color: const Color(0xFFFEB83D), width: 0.8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${_selectedCurrency.flagEmoji} ${_selectedCurrency.name} (${_selectedCurrency.code})',
            style: const TextStyle(color: Colors.white, fontSize: 9),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.arrow_drop_down, color: Color(0xFFFEB83D)),
        ],
      ),
    );
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
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          );
        }).toList();
      },
      color: const Color(0xFF2A2A2A),
      child: _buildButton(),
    );
  }
}
