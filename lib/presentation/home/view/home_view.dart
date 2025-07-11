import 'package:crypto_wallet/core/domain/entities/currency.dart';
import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/presentation/home/view_model/home_view_model.dart';
import 'package:crypto_wallet/presentation/home/widgets/crypto_item_home.dart';
import 'package:crypto_wallet/presentation/home/widgets/loading_list.dart';
import 'package:crypto_wallet/presentation/home/widgets/popup_menu_filter_crypto.dart';
import 'package:crypto_wallet/presentation/home/widgets/popup_menu_filter_currency.dart';
import 'package:crypto_wallet/shared/base_view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final RefreshController refreshController = RefreshController();
  bool _isInit = true;
  late HomeViewModel viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) return;
    _isInit = false;
    viewModel = context.read<HomeViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.fetchCryptoCurrencies(viewModel.currency, context);
    });
  }

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            viewModel.fetchCryptoCurrencies(
                              currency.code,
                              context,
                            );
                            viewModel.filterCryptosByFilter(
                              HomeFilterCrypto.all,
                            );
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
                        'Cotação / Últimas 24 horas',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: AppFontSizes.xx,
                        ),
                      ),
                    ],
                  ),
                  Divider(color: AppColors.divider),
                  Expanded(
                    child: Stack(
                      children: [
                        SmartRefresher(
                          controller: refreshController,
                          onRefresh: () async {
                            viewModel.refreshCryptoCurrencies(context);
                            refreshController.refreshCompleted();
                          },
                          header: MaterialClassicHeader(
                            color: AppColors.white,
                            backgroundColor: AppColors.transparent,
                          ),
                          child: ListView.separated(
                            physics: const ClampingScrollPhysics(),
                            separatorBuilder:
                                (_, __) => const Divider(
                                  color: AppColors.divider,
                                  height: 0.5,
                                ),
                            itemCount: viewModel.filteredCryptos.length,
                            itemBuilder: (context, index) {
                              final crypto = viewModel.filteredCryptos[index];
                              return CryptoItemHome(
                                currencySymbol:
                                    Currency.fromCode(
                                      viewModel.currency,
                                    )?.sifra ??
                                    '?',
                                crypto: crypto,
                              );
                            },
                          ),
                        ),
                        AnimatedOpacity(
                          opacity:
                              viewModel.state == ViewState.loading ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 400),
                          child: IgnorePointer(
                            ignoring: viewModel.state != ViewState.loading,
                            child: const ColoredBox(
                              color: Colors.black,
                              child: Center(child: LoadingList()),
                            ),
                          ),
                        ),
                      ],
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
