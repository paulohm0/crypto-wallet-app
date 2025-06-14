import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/ui/portfolio/widgets/purchased_crypto_item.dart';
import 'package:flutter/material.dart';

class PurchasedCryptoList extends StatelessWidget {
  const PurchasedCryptoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      separatorBuilder: (context, index) {
        return const Divider(color: AppColors.divider, height: 0.5);
      },
      itemCount: 6,
      itemBuilder: (context, index) {
        return PurchasedCryptoItem();
      },
    );
  }
}
