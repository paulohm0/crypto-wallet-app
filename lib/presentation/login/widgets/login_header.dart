import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Crypto',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: AppFontSizes.ll,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'Wallet',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: AppFontSizes.ll,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Invista com segurança.\n',
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: AppFontSizes.xs,
                ),
              ),
              TextSpan(
                text: 'Registre-se',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: AppFontSizes.xs,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' agora.',
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: AppFontSizes.xs,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
