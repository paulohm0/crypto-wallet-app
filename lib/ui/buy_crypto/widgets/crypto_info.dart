import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:crypto_wallet/core/utils/translator_crypto_description.dart';
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
              'Sobre o projeto',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: AppFontWeights.semiBold,
              ),
            ),
          ),
          FutureBuilder(
            future: selectedCrypto.crypto.description.translateToPTBR(),
            builder: (context, snapshot) {
              return Text(
                snapshot.data ?? 'Sem Informações',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: AppFontSizes.xs,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
