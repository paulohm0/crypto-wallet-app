import 'dart:math';

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

  double generateFee() {
    final random = Random();
    return 1 + random.nextDouble() * 2;
  }

  @override
  Widget build(BuildContext context) {
    double fee = generateFee();
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Você vai pagar',
                              style: TextStyle(
                                fontWeight: AppFontWeights.bold,
                                fontSize: AppFontSizes.xs,
                              ),
                            ),
                            Text(
                              'R\$ ${(quantity + fee).toStringAsFixed(2).toCurrency(tradeInformation.cryptoArgs.currencySymbol)}',
                              style: TextStyle(
                                fontWeight: AppFontWeights.bold,
                                fontSize: AppFontSizes.xs,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Você receberá',
                              style: TextStyle(
                                fontWeight: AppFontWeights.bold,
                                fontSize: AppFontSizes.xs,
                              ),
                            ),
                            Text(
                              '${value.toStringAsFixed(6)} da cripto ${tradeInformation.cryptoArgs.crypto.symbol}',
                              style: TextStyle(
                                fontWeight: AppFontWeights.bold,
                                fontSize: AppFontSizes.xs,
                              ),
                            ),
                          ],
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
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Preço',
                      style: TextStyle(
                        fontWeight: AppFontWeights.medium,
                        fontSize: AppFontSizes.xs,
                      ),
                    ),
                    Text(
                      '1 ${tradeInformation.cryptoArgs.crypto.symbol} = ${tradeInformation.cryptoArgs.crypto.latestPrice.amount.amount.toCurrency(tradeInformation.cryptoArgs.currencySymbol)}',
                      style: TextStyle(
                        fontWeight: AppFontWeights.medium,
                        fontSize: AppFontSizes.xs,
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Valor da compra',
                      style: TextStyle(
                        fontWeight: AppFontWeights.medium,
                        fontSize: AppFontSizes.xs,
                      ),
                    ),
                    Text(
                      quantity
                          .toStringAsFixed(2)
                          .toCurrency(
                            tradeInformation.cryptoArgs.currencySymbol,
                          ),
                      style: TextStyle(
                        fontWeight: AppFontWeights.medium,
                        fontSize: AppFontSizes.xs,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Taxas',
                      style: TextStyle(
                        fontWeight: AppFontWeights.medium,
                        fontSize: AppFontSizes.xs,
                      ),
                    ),
                    Text(
                      fee
                          .toStringAsFixed(2)
                          .toCurrency(
                            tradeInformation.cryptoArgs.currencySymbol,
                          ),
                      style: TextStyle(
                        fontWeight: AppFontWeights.medium,
                        fontSize: AppFontSizes.xs,
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total a pagar',
                      style: TextStyle(
                        fontWeight: AppFontWeights.medium,
                        fontSize: AppFontSizes.xs,
                      ),
                    ),
                    Text(
                      (quantity + fee)
                          .toStringAsFixed(2)
                          .toCurrency(
                            tradeInformation.cryptoArgs.currencySymbol,
                          ),
                      style: TextStyle(
                        fontWeight: AppFontWeights.medium,
                        fontSize: AppFontSizes.xs,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
