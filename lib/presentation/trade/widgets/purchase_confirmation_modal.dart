import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:crypto_wallet/core/utils/formater_crypto_amount.dart';
import 'package:crypto_wallet/presentation/info_crypto/view/info_crypto_view.dart';
import 'package:flutter/material.dart';

class PurchaseConfirmationModal extends StatelessWidget {
  final TradeArguments tradeInformation;
  final double quantity;
  final double value;
  final VoidCallback onConfirm;

  const PurchaseConfirmationModal({
    super.key,
    required this.tradeInformation,
    required this.quantity,
    required this.value,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(40),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Você vai pagar R\$ ${quantity.toStringAsFixed(2)}',
                        ),
                        Text(
                          'Você receberá ${value.toStringAsFixed(6)} da cripto ${tradeInformation.cryptoArgs.crypto.symbol}',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: ClipOval(
                      child: Image.network(
                        tradeInformation.cryptoArgs.crypto.imageUrl,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Preço'),
                    Text(
                      '1 ${tradeInformation.cryptoArgs.crypto.symbol} = R\$ ${tradeInformation.cryptoArgs.crypto.latestPrice.amount.amount.toCurrency(tradeInformation.cryptoArgs.currencySymbol)}',
                    ),
                  ],
                ),
                Divider(color: AppColors.grey),
                Text('Valor da compra R\$ 99.00'),
                Text('Taxa R\$ 2.00'),
                Divider(color: AppColors.grey),
                Text('Total a pagar R\$ 100.00'),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                onConfirm();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Confirmar Compra',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: AppFontSizes.sm,
                    fontWeight: AppFontWeights.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
