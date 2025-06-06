import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:flutter/material.dart';

class PercentChangeIndicator extends StatelessWidget {
  final double percentChangeLastHour;
  const PercentChangeIndicator({
    super.key,
    required this.percentChangeLastHour,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        percentChangeLastHour < 0
            ? Icon(
              Icons.arrow_downward,
              color: AppColors.red,
              size: AppFontSizes.xs,
            )
            : percentChangeLastHour == 0.0
            ? SizedBox()
            : Icon(
              Icons.arrow_upward,
              color: AppColors.green,
              size: AppFontSizes.xs,
            ),
        percentChangeLastHour == 0.0
            ? Text(
              'Não Informado',
              style: TextStyle(
                fontSize: AppFontSizes.xx,
                fontWeight: AppFontWeights.bold,
                color: AppColors.grey,
              ),
            )
            : Text(
              '${percentChangeLastHour.toStringAsFixed(5)} %',
              style: TextStyle(
                fontSize: AppFontSizes.xx,
                fontWeight: AppFontWeights.bold,
                color:
                    percentChangeLastHour < 0 ? AppColors.red : AppColors.green,
              ),
            ),
      ],
    );
  }
}
