import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:crypto_wallet/core/utils/formater_crypto_amount.dart';
import 'package:crypto_wallet/presentation/_common/utils/trade_labels.dart';
import 'package:crypto_wallet/presentation/_common/widgets/app_bar_custom.dart';
import 'package:crypto_wallet/presentation/home/widgets/crypto_item_home.dart';
import 'package:crypto_wallet/presentation/info_crypto/view_model/info_crypto_view_model.dart';
import 'package:crypto_wallet/presentation/info_crypto/widgets/about_crypto.dart';
import 'package:crypto_wallet/presentation/info_crypto/widgets/crypto_chart.dart';
import 'package:crypto_wallet/presentation/info_crypto/widgets/filter_crypto_chart.dart';
import 'package:crypto_wallet/shared/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TradeArguments {
  final TradeLabels label;
  final BuyCryptoArguments cryptoArgs;

  TradeArguments({required this.label, required this.cryptoArgs});
}

class InfoCryptoView extends StatefulWidget {
  const InfoCryptoView({super.key});

  @override
  State<InfoCryptoView> createState() => _InfoCryptoViewState();
}

class _InfoCryptoViewState extends State<InfoCryptoView> {
  late BuyCryptoArguments selectedCrypto;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedCrypto =
        ModalRoute.of(context)!.settings.arguments as BuyCryptoArguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Consumer<InfoCryptoViewModel>(
        builder: (context, viewModel, _) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 8.0,
              right: 8.0,
              bottom: 24.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedCrypto.crypto.name,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: AppFontWeights.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      ClipOval(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network(
                            selectedCrypto.crypto.imageUrl,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/crypto_default_icon_image.jpg',
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Preço',
                              style: TextStyle(
                                height: 1.0,
                                color: AppColors.grey,
                                fontSize: AppFontSizes.xx,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              selectedCrypto.crypto.latestPrice.amount.amount
                                  .toCurrency(selectedCrypto.currencySymbol),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: AppFontSizes.lg,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '${viewModel.priceData?.toStringAsFixed(2)}% (${viewModel.lastFilter.label})',
                        style: TextStyle(
                          color:
                              viewModel.priceData! < 0
                                  ? AppColors.red
                                  : AppColors.green,
                          fontSize: AppFontSizes.sss,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Divider(color: AppColors.divider, height: 1.0),
                  FilterCryptoChart(
                    onFilterChanged: (filter) {
                      viewModel.fetchCryptoPricesToChart(
                        selectedCrypto.crypto.id,
                        selectedCrypto.crypto.currency,
                        filter: filter,
                      );
                    },
                  ),
                  Divider(color: AppColors.divider, height: 1.0),
                  CryptoChart(spots: viewModel.spots.reversed.toList()),
                  Divider(color: AppColors.divider),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.greyBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.trade,
                              arguments: TradeArguments(
                                label: TradeLabels.vender,
                                cryptoArgs: selectedCrypto,
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.upload, color: AppColors.primary),
                              Text(
                                TradeLabels.vender.label,
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: AppFontWeights.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.greyBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.trade,
                              arguments: TradeArguments(
                                label: TradeLabels.comprar,
                                cryptoArgs: selectedCrypto,
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.download, color: AppColors.primary),
                              Text(
                                TradeLabels.comprar.label,
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: AppFontWeights.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  AboutCrypto(selectedCrypto: selectedCrypto),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
