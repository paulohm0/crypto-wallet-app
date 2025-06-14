import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:flutter/material.dart';

class PurchasedCryptoItem extends StatelessWidget {
  const PurchasedCryptoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ClipOval(
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/1200px-Bitcoin.svg.png',
                width: 40,
                height: 40,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/crypto_default_icon_image.jpg',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Bitcoin ',
                  style: TextStyle(
                    fontWeight: AppFontWeights.bold,
                    fontSize: AppFontSizes.sm,
                    color: AppColors.white,
                  ),
                  children: [
                    TextSpan(
                      text: 'BTC',
                      style: TextStyle(
                        fontSize: AppFontSizes.xs,
                        color: AppColors.grey,
                        fontWeight: AppFontWeights.light,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Quantidade: 5.458 BTC',
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: AppFontWeights.bold,
                  fontSize: AppFontSizes.ss,
                ),
              ),
              Text(
                'Valor: R\$ 24.39',
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: AppFontWeights.bold,
                  fontSize: AppFontSizes.ss,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Total: R\$ 133.316',
                style: TextStyle(
                  fontWeight: AppFontWeights.bold,
                  fontSize: AppFontSizes.sm,
                  color: AppColors.white,
                ),
              ),
              Text(
                '10/05/2025, 09:39 AM',
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: AppFontWeights.bold,
                  fontSize: AppFontSizes.ss,
                ),
              ),
              Text(
                'Transação Aprovada',
                style: TextStyle(
                  color: AppColors.green,
                  fontWeight: AppFontWeights.bold,
                  fontSize: AppFontSizes.ss,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
