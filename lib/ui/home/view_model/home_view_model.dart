import 'package:crypto_wallet/data/datasource/crypto_datasource.dart';
import 'package:crypto_wallet/data/models/crypto_model.dart';
import 'package:crypto_wallet/shared/base_view_model/base_view_model.dart';
import 'package:crypto_wallet/ui/home/widgets/popup_menu_filter_crypto.dart';

class HomeViewModel extends BaseViewModel {
  final CryptoDatasource cryptoDatasource;
  HomeViewModel(this.cryptoDatasource) {
    _currency = 'BRL';
    fetchCryptoCurrencies(_currency);
  }

  List<CryptoModel> allCryptos = [];
  List<CryptoModel> filteredCryptos = [];

  late String _currency;
  String get currency => _currency;

  HomeFilterCrypto selectedFilter = HomeFilterCrypto.all;

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
                (cryptoA, cryptoB) => cryptoB.latestPrice.percentChange.hour
                    .compareTo(cryptoA.latestPrice.percentChange.hour),
              );
        break;
      case HomeFilterCrypto.low:
        filteredCryptos =
            allCryptos
                .where((crypto) => crypto.latestPrice.percentChange.hour < 0)
                .toList()
              ..sort(
                (cryptoA, cryptoB) => cryptoB.latestPrice.percentChange.hour
                    .compareTo(cryptoA.latestPrice.percentChange.hour),
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

  Future<void> fetchCryptoCurrencies(String currency) async {
    try {
      setState(ViewState.loading);
      _currency = currency;
      selectedFilter = HomeFilterCrypto.all;
      allCryptos = await cryptoDatasource.getCryptos(currency);
      filteredCryptos =
          allCryptos
              .where((crypto) => crypto.latestPrice.amount.amount != '0.00')
              .toList();
      setState(ViewState.success);
    } catch (error) {
      setState(ViewState.error, 'Não foi possivel buscar as Criptomoedas');
    }
    notifyListeners();
  }
}
