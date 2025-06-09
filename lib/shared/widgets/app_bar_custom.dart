import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppBarCustom({super.key}) : preferredSize = const Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Crypto',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: AppFontSizes.xl,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'Wallet',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: AppFontSizes.xl,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
