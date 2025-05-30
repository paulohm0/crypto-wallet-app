import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/data/currency.dart';
import 'package:crypto_wallet/shared/base_view_model/base_view_model.dart';
import 'package:crypto_wallet/shared/widgets/app_bar_custom.dart';
import 'package:crypto_wallet/ui/home/view_model/home_view_model.dart';
import 'package:crypto_wallet/ui/home/widgets/crypto_item_home.dart';
import 'package:crypto_wallet/ui/home/widgets/popup_menu_filter_crypto.dart';
import 'package:crypto_wallet/ui/home/widgets/popup_menu_filter_currency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, _) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    maxLines: 1,
                    maxLength: 12,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'Buscar por moeda',
                      hintStyle: const TextStyle(color: AppColors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppColors.greyBackground,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 6.0,
                      ),
                      constraints: const BoxConstraints(maxHeight: 35.0),
                    ),
                    style: const TextStyle(
                      fontSize: AppFontSizes.xs,
                      color: AppColors.white,
                    ),
                    onChanged: (value) {
                      viewModel.filterCryptosByInputUser(value);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PopupMenuFilterCrypto(
                          selectedFilter: viewModel.selectedFilter,
                          onFilterChanged: (filter) {
                            viewModel.filterCryptosByFilter(filter);
                          },
                        ),
                        PopupMenuFilterCurrency(
                          onSelected: (Currency currency) {
                            viewModel.fetchCryptoCurrencies(currency.code);
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Criptomoedas disponíveis',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: AppFontSizes.xx,
                        ),
                      ),
                      Text(
                        'Cotação / Última hora',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: AppFontSizes.xx,
                        ),
                      ),
                    ],
                  ),
                  Divider(color: AppColors.divider),
                  Expanded(
                    child:
                        viewModel.state == ViewState.loading
                            ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                                strokeWidth: 2.0,
                              ),
                            )
                            : ListView.separated(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: false,
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  color: AppColors.divider,
                                  height: 0.5,
                                );
                              },
                              itemCount: viewModel.filteredCryptos.length,
                              itemBuilder: (context, index) {
                                final crypto = viewModel.filteredCryptos[index];
                                return CryptoItemHome(
                                  name: crypto.name,
                                  currencySymbol:
                                      Currency.fromCode(
                                        viewModel.currency,
                                      )?.sifra ??
                                      '?',
                                  symbol: crypto.symbol,
                                  iconAssetPath: crypto.imageUrl,
                                  amount: crypto.latestPrice.amount.amount,
                                  percentChangeLastHour:
                                      crypto.latestPrice.percentChange.hour,
                                );
                              },
                            ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
