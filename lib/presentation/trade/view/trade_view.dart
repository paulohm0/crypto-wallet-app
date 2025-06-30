import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:crypto_wallet/presentation/_common/widgets/app_bar_custom.dart';
import 'package:crypto_wallet/presentation/info_crypto/view/info_crypto_view.dart';
import 'package:crypto_wallet/presentation/trade/view_model/trade_view_model.dart';
import 'package:crypto_wallet/presentation/trade/widgets/buy_crypto_form.dart';
import 'package:crypto_wallet/presentation/trade/widgets/show_purchase_confirmation.dart';
import 'package:crypto_wallet/shared/navigation/app_routes.dart';
import 'package:crypto_wallet/shared/navigation/main_nav_controller.dart';
import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TradeView extends StatefulWidget {
  const TradeView({super.key});

  @override
  State<TradeView> createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  late CurrencyTextFieldController controller;
  late TradeArguments tradeInformation;
  late TradeViewModel viewModel;
  String? errorFieldValue;
  bool _hasInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tradeInformation =
        ModalRoute.of(context)!.settings.arguments as TradeArguments;
    viewModel = TradeViewModel(tradeInformation);
  }

  @override
  void initState() {
    super.initState();
    controller = CurrencyTextFieldController(
      currencySymbol: '',
      decimalSymbol: ',',
      thousandSymbol: '.',
      initDoubleValue: 0.00,
    );
    controller.addListener(() {
      if (_hasInitialized) {
        setState(() {});
      } else {
        _hasInitialized = true;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tradeInformation.label.name.toUpperCase(),
                          style: TextStyle(color: AppColors.white),
                        ),
                        const SizedBox(width: 8.0),
                        ClipOval(
                          child: Image.network(
                            tradeInformation.cryptoArgs.crypto.imageUrl,
                            width: 25,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          tradeInformation.cryptoArgs.crypto.symbol,
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: AppFontWeights.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    viewModel.isBuy
                        ? Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Disponível para investir: ',
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontWeight: AppFontWeights.medium,
                                  fontSize: AppFontSizes.xs,
                                ),
                              ),
                              TextSpan(
                                text: 'R\$ 0,00',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: AppFontWeights.medium,
                                  fontSize: AppFontSizes.xs,
                                ),
                              ),
                            ],
                          ),
                        )
                        : Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Atualmente você possue: ',
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontWeight: AppFontWeights.medium,
                                  fontSize: AppFontSizes.xs,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'R\$ 100,00 em ${tradeInformation.cryptoArgs.crypto.symbol}',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: AppFontWeights.medium,
                                  fontSize: AppFontSizes.xs,
                                ),
                              ),
                            ],
                          ),
                        ),
                    const SizedBox(height: 4.0),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Valor Mínimo: ',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontWeight: AppFontWeights.medium,
                              fontSize: AppFontSizes.xs,
                            ),
                          ),
                          TextSpan(
                            text: 'R\$ 10,00',
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: AppFontWeights.medium,
                              fontSize: AppFontSizes.xs,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    BuyCryptoForm(
                      tradeInformation: tradeInformation,
                      controller: controller,
                      cryptoAmount: viewModel.getCryptoAmount(controller),
                      errorFieldValue: viewModel.getErrorFieldValue(controller),
                      viewModel: viewModel,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      viewModel.isValidFieldValue(controller)
                          ? () {
                            showPurchaseConfirmationModal(
                              context: context,
                              tradeInformation: tradeInformation,
                              quantity: controller.doubleValue,
                              value: viewModel.getCryptoAmount(controller),
                              viewModel: viewModel,
                              onConfirm: () {
                                Provider.of<MainNavController>(
                                  context,
                                  listen: false,
                                ).setIndex(1);
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoutes.main,
                                );
                              },
                            );
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      tradeInformation.label.name.toUpperCase(),
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: AppFontSizes.sm,
                        fontWeight: AppFontWeights.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
