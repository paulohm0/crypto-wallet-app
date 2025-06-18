import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:flutter/material.dart';

class OptionBox extends StatelessWidget {
  final IconData icon;
  final String label;
  const OptionBox({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: AppColors.primary),
                  SizedBox(width: 8.0),
                  Text(
                    label,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: AppFontWeights.bold,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColors.grey,
                size: 12,
              ),
            ],
          ),
        ),
        Divider(color: AppColors.greyBackground),
      ],
    );
  }
}
