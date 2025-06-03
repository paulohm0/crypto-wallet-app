import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/utils/formater_crypto_amount.dart';
import 'package:crypto_wallet/shared/widgets/app_bar_custom.dart';
import 'package:crypto_wallet/ui/buy_crypto/view_model/buy_crypto_view_model.dart';
import 'package:crypto_wallet/ui/buy_crypto/widgets/crypto_chart.dart';
import 'package:crypto_wallet/ui/buy_crypto/widgets/filter_crypto_chart.dart';
import 'package:crypto_wallet/ui/home/widgets/crypto_item_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyCryptoView extends StatefulWidget {
  const BuyCryptoView({super.key});

  @override
  State<BuyCryptoView> createState() => _BuyCryptoViewState();
}

class _BuyCryptoViewState extends State<BuyCryptoView> {
  late BuyCryptoViewModel viewModel;
  late BuyCryptoArguments selectedCrypto;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedCrypto =
        ModalRoute.of(context)!.settings.arguments as BuyCryptoArguments;
    viewModel = context.read<BuyCryptoViewModel>();
    viewModel.fetchCryptoPricesToChart(
      selectedCrypto.crypto.id,
      selectedCrypto.crypto.currency,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Consumer<BuyCryptoViewModel>(
        builder: (context, viewModel, _) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.network(selectedCrypto.crypto.imageUrl),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Preço',
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          selectedCrypto.crypto.latestPrice.amount.amount
                              .toCurrency(selectedCrypto.currencySymbol),
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${(viewModel.priceData!.percentChange * 100).toStringAsFixed(2)}%',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.divider),
                FilterCryptoChart(),
                Divider(color: AppColors.divider),
                CryptoChart(spots: viewModel.spots.reversed.toList()),
                Divider(color: AppColors.divider),
              ],
            ),
          );
        },
      ),
    );
  }
}
