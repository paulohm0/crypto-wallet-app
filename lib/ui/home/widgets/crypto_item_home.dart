import 'dart:ui';

import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:crypto_wallet/core/utils/formater_crypto_amount.dart';
import 'package:crypto_wallet/core/utils/translator_crypto_description.dart';
import 'package:crypto_wallet/data/models/crypto_model.dart';
import 'package:crypto_wallet/ui/buy_crypto/view_model/buy_crypto_view_model.dart';
import 'package:crypto_wallet/ui/home/utils/percent_change_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyCryptoArguments {
  final CryptoModel crypto;
  final String currencySymbol;

  BuyCryptoArguments({required this.crypto, required this.currencySymbol});
}

class CryptoItemHome extends StatefulWidget {
  final CryptoModel crypto;
  final String currencySymbol;

  const CryptoItemHome({
    super.key,
    required this.crypto,
    required this.currencySymbol,
  });

  @override
  State<CryptoItemHome> createState() => _CryptoItemHomeState();
}

class _CryptoItemHomeState extends State<CryptoItemHome> {
  late BuyCryptoViewModel viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel = context.read<BuyCryptoViewModel>();
      viewModel.fetchCryptoPricesToChart(
        widget.crypto.id,
        widget.crypto.currency,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder:
              (context) => Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(color: Colors.black.withAlpha(25)),
                  ),
                  const Center(child: CircularProgressIndicator()),
                ],
              ),
        );
        widget.crypto.description =
            await widget.crypto.description.translateToPTBR();
        await Future.delayed(const Duration(milliseconds: 1000));
        if (context.mounted) Navigator.of(context).pop();
        await Future.delayed(const Duration(milliseconds: 50));
        if (context.mounted) {
          Navigator.pushNamed(
            context,
            '/buy',
            arguments: BuyCryptoArguments(
              crypto: widget.crypto,
              currencySymbol: widget.currencySymbol,
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                widget.crypto.imageUrl,
                width: 30,
                height: 30,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/crypto_default_icon_image.jpg',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.crypto.name,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: AppFontSizes.sss,
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    widget.crypto.symbol,
                    style: TextStyle(
                      fontSize: AppFontSizes.sss,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.crypto.latestPrice.amount.amount.toCurrency(
                      widget.currencySymbol,
                    ),
                    style: TextStyle(
                      fontSize: AppFontSizes.sss,
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.white,
                    ),
                  ),
                  PercentChangeIndicator(
                    percentChangeLastHour:
                        widget.crypto.latestPrice.percentChange.day,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
