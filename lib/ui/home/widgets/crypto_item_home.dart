import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:crypto_wallet/core/utils/formater_crypto_amount.dart';
import 'package:crypto_wallet/shared/widgets/percent_change_indicator.dart';
import 'package:flutter/material.dart';

class CryptoItemHome extends StatelessWidget {
  final String iconAssetPath;
  final String name;
  final String symbol;
  final String amount;
  final double percentChangeLastHour;
  final String currencySymbol;
  const CryptoItemHome({
    super.key,
    required this.name,
    required this.symbol,
    required this.iconAssetPath,
    required this.amount,
    required this.percentChangeLastHour,
    required this.currencySymbol,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                iconAssetPath,
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
                    name,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: AppFontSizes.sss,
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    symbol,
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
                    amount.toCurrency(currencySymbol),
                    style: TextStyle(
                      fontSize: AppFontSizes.sss,
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.white,
                    ),
                  ),
                  PercentChangeIndicator(
                    percentChangeLastHour: percentChangeLastHour,
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
