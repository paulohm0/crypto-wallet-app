import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:crypto_wallet/presentation/_common/widgets/app_bar_custom.dart';
import 'package:crypto_wallet/presentation/info_crypto/view/info_crypto_view.dart';
import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';

class TradeView extends StatefulWidget {
  const TradeView({super.key});

  @override
  State<TradeView> createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  late TradeArguments tradeInformation;
  late final CurrencyTextFieldController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CurrencyTextFieldController(
      currencySymbol: '',
      decimalSymbol: ',',
      thousandSymbol: '.',
      initDoubleValue: 0.00,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tradeInformation =
        ModalRoute.of(context)!.settings.arguments as TradeArguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tradeInformation.label.name.toUpperCase(),
                    style: TextStyle(color: AppColors.white),
                  ),
                  const SizedBox(width: 8.0),
                  ClipOval(
                    child: Image.network(
                      tradeInformation.cryptoArgs.crypto.imageUrl,
                      width: 25,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    tradeInformation.cryptoArgs.crypto.symbol,
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: AppFontWeights.bold,
                    ),
                  ),
                ],
              ),
              Center(
                child: TextField(
                  controller: _controller,
                  showCursor: false,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    prefixText: 'R\$ ',
                    prefixStyle: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
