import 'package:crypto_wallet/data/datasource/crypto_datasource.dart';
import 'package:crypto_wallet/data/models/crypto_model.dart';
import 'package:crypto_wallet/shared/base_view_model/base_view_model.dart';
import 'package:crypto_wallet/ui/home/widgets/popup_menu_filter_crypto.dart';
import 'package:flutter/widgets.dart';

class HomeViewModel extends BaseViewModel {
  final CryptoDatasource cryptoDatasource;
  HomeViewModel(this.cryptoDatasource);

  List<CryptoModel> allCryptos = [];
  List<CryptoModel> filteredCryptos = [];

  String _currency = 'BRL';
  String get currency => _currency;

  HomeFilterCrypto selectedFilter = HomeFilterCrypto.all;

  bool _allImagesPrecached = false;
  bool get allImagesPrecached => _allImagesPrecached;

  void filterCryptosByFilter(HomeFilterCrypto label) {
    selectedFilter = label;
    switch (label) {
      case HomeFilterCrypto.all:
        filteredCryptos = allCryptos;
        break;
      case HomeFilterCrypto.high:
        filteredCryptos =
            allCryptos
                .where((crypto) => crypto.latestPrice.percentChange.hour > 0)
                .toList()
              ..sort(
                (a, b) => b.latestPrice.percentChange.hour.compareTo(
                  a.latestPrice.percentChange.hour,
                ),
              );
        break;
      case HomeFilterCrypto.low:
        filteredCryptos =
            allCryptos
                .where((crypto) => crypto.latestPrice.percentChange.hour < 0)
                .toList()
              ..sort(
                (a, b) => b.latestPrice.percentChange.hour.compareTo(
                  a.latestPrice.percentChange.hour,
                ),
              );
        break;
    }
    notifyListeners();
  }

  void filterCryptosByInputUser(String input) {
    final inputLowerCase = input.toLowerCase();
    filteredCryptos =
        allCryptos
            .where(
              (crypto) => crypto.name.toLowerCase().startsWith(inputLowerCase),
            )
            .toList();
    notifyListeners();
  }

  Future<void> fetchCryptoCurrencies(
    String currency,
    BuildContext context,
  ) async {
    try {
      _currency = currency;
      setState(ViewState.loading);
      selectedFilter = HomeFilterCrypto.all;
      _allImagesPrecached = false;

      allCryptos = await cryptoDatasource.getCryptos(_currency);

      await Future.wait(
        allCryptos.map((crypto) async {
          final image = NetworkImage(crypto.imageUrl);
          await precacheImage(image, context);
        }),
      );

      _allImagesPrecached = true;

      filteredCryptos =
          allCryptos.where((crypto) {
            final amount =
                double.tryParse(crypto.latestPrice.amount.amount) ?? 0.0;
            return amount >= 0.01;
          }).toList();

      setState(ViewState.success);
    } catch (error) {
      setState(ViewState.error, 'Não foi possível buscar as Criptomoedas');
    }
  }
}
