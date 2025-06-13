import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:flutter/material.dart';

class PortfolioActionButtons extends StatelessWidget {
  const PortfolioActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greyBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Depositar',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: AppFontWeights.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greyBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Sacar',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: AppFontWeights.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
