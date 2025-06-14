import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:flutter/material.dart';

class PortfolioCard extends StatelessWidget {
  const PortfolioCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyBackground,
        border: Border.all(color: AppColors.primary, width: 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Valor dos ativos',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppFontSizes.ss,
                      ),
                    ),
                    Text(
                      'R\$ 2.509,75',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppFontSizes.ll,
                        fontWeight: AppFontWeights.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  '+9,77%',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: AppFontSizes.xs,
                    fontWeight: AppFontWeights.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Valor Investido',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppFontSizes.ss,
                      ),
                    ),
                    Text(
                      'R\$ 1.618,75',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppFontSizes.lg,
                        fontWeight: AppFontWeights.medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                  child: VerticalDivider(
                    thickness: 1,
                    width: 20,
                    color: AppColors.grey2,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Valor disponível para investimento',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppFontSizes.ss,
                      ),
                    ),
                    Text(
                      'R\$ 504,50',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppFontSizes.lg,
                        fontWeight: AppFontWeights.medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
