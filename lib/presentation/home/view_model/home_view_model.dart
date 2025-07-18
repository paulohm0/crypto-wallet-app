import 'package:crypto_wallet/core/services/firebase/firebase_client.dart';
import 'package:crypto_wallet/data/datasource/api/crypto_datasource.dart';
import 'package:crypto_wallet/data/models/cryptocurrency/crypto_model.dart';
import 'package:crypto_wallet/presentation/home/widgets/popup_menu_filter_crypto.dart';
import 'package:crypto_wallet/shared/base_view_model/base_view_model.dart';
import 'package:flutter/widgets.dart';

class HomeViewModel extends BaseViewModel {
  final CryptoDatasource cryptoDatasource;
  final FirebaseClient firebaseClient;
  HomeViewModel(this.cryptoDatasource, this.firebaseClient);

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
        filteredCryptos = [...allCryptos]..sort((crypto1, crypto2) {
          final valorCrypto1 =
              double.tryParse(crypto1.latestPrice.amount.amount) ?? 0.0;
          final valorCrypto2 =
              double.tryParse(crypto2.latestPrice.amount.amount) ?? 0.0;
          return valorCrypto2.compareTo(valorCrypto1);
        });
        break;
      case HomeFilterCrypto.high:
        filteredCryptos =
            allCryptos
                .where((crypto) => crypto.latestPrice.percentChange.day > 0)
                .toList()
              ..sort(
                (a, b) => b.latestPrice.percentChange.day.compareTo(
                  a.latestPrice.percentChange.day,
                ),
              );
        break;
      case HomeFilterCrypto.low:
        filteredCryptos =
            allCryptos
                .where((crypto) => crypto.latestPrice.percentChange.day < 0)
                .toList()
              ..sort(
                (a, b) => b.latestPrice.percentChange.day.compareTo(
                  a.latestPrice.percentChange.day,
                ),
              );
        break;
    }
    notifyListeners();
  }

  void filterCryptosByInputUser(String input) {
    final inputLowerCase = input.toLowerCase();
    if (inputLowerCase.isEmpty) {
      filterCryptosByFilter(selectedFilter);
    } else {
      filteredCryptos =
          allCryptos
              .where(
                (crypto) => crypto.name.toLowerCase().contains(inputLowerCase),
              )
              .toList();
      notifyListeners();
    }
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

      allCryptos =
          allCryptos.where((crypto) {
            final amount =
                double.tryParse(crypto.latestPrice.amount.amount) ?? 0.0;
            return amount >= 0.01;
          }).toList();

      filterCryptosByFilter(HomeFilterCrypto.all);

      setState(ViewState.success);
    } catch (error) {
      setState(ViewState.error, 'Não foi possível buscar as Criptomoedas');
    }
  }

  Future<void> refreshCryptoCurrencies(BuildContext context) async {
    await fetchCryptoCurrencies(currency, context);
    filterCryptosByFilter(HomeFilterCrypto.all);
  }
}
