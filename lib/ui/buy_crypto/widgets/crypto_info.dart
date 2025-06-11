import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:crypto_wallet/ui/home/widgets/crypto_item_home.dart';
import 'package:flutter/material.dart';

class CryptoInfo extends StatelessWidget {
  final BuyCryptoArguments selectedCrypto;
  const CryptoInfo({super.key, required this.selectedCrypto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Sobre o ${selectedCrypto.crypto.name}',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: AppFontWeights.semiBold,
              ),
            ),
          ),
          Text(
            selectedCrypto.crypto.description,
            style: TextStyle(color: AppColors.white, fontSize: AppFontSizes.xs),
          ),
        ],
      ),
    );
  }
}
