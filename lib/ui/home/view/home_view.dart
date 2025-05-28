import 'package:crypto_wallet/data/models/currency.dart';
import 'package:crypto_wallet/shared/base_view_model.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, _) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: PopupMenuFilterCurrency(
                        onSelected: (Currency currency) {
                          viewModel.fetchCryptoCurrencies(currency.code);
                        },
                      ),
                    ),
                    TextField(
                      maxLines: 1,
                      maxLength: 12,
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'Buscar por moeda',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFF1E1E1E),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 6.0,
                        ),
                        constraints: const BoxConstraints(maxHeight: 35.0),
                      ),
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                      onChanged: (value) {
                        viewModel.filterCryptosByInputUser(value);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Criptomoedas',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          PopupMenuFilterCrypto(
                            selectedFilter: viewModel.selectedFilter,
                            onFilterChanged: (filter) {
                              viewModel.filterCryptosByFilter(filter);
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child:
                          viewModel.state == ViewState.loading
                              ? const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xFFFEB83D),
                                  strokeWidth: 2.0,
                                ),
                              )
                              : ListView.separated(
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: false,
                                separatorBuilder: (context, index) {
                                  return const Divider(color: Colors.white10);
                                },
                                itemCount: viewModel.filteredCryptos.length,
                                itemBuilder: (context, index) {
                                  final crypto =
                                      viewModel.filteredCryptos[index];
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
      ),
    );
  }
}
