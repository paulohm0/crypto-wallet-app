import 'package:crypto_wallet/data/datasource/crypto_datasource.dart';
import 'package:crypto_wallet/data/models/crypto_model.dart';
import 'package:crypto_wallet/shared/base_view_model.dart';
import 'package:crypto_wallet/ui/home/widgets/popup_menu_filter_crypto.dart';

class HomeViewModel extends BaseViewModel {
  final CryptoDatasource datasource;
  HomeViewModel(this.datasource) {
    _currency = 'BRL';
    fetchCryptoCurrencies(_currency);
  }

  List<CryptoModel> allCryptosCurrencies = [];
  List<CryptoModel> filteredCryptosCurrencies = [];

  late String _currency;
  String get currency => _currency;

  HomeFilterCrypto selectedFilter = HomeFilterCrypto.all;

  void filterCryptosByFilter(HomeFilterCrypto label) {
    selectedFilter = label;
    switch (label) {
      case HomeFilterCrypto.all:
        filteredCryptosCurrencies = allCryptosCurrencies;
        break;
      case HomeFilterCrypto.high:
        filteredCryptosCurrencies =
            allCryptosCurrencies
                .where((crypto) => crypto.latestPrice.percentChange.hour > 0)
                .toList();
        filteredCryptosCurrencies.sort(
          (cryptoA, cryptoB) => cryptoB.latestPrice.percentChange.hour
              .compareTo(cryptoA.latestPrice.percentChange.hour),
        );
        break;
      case HomeFilterCrypto.low:
        filteredCryptosCurrencies =
            allCryptosCurrencies
                .where((crypto) => crypto.latestPrice.percentChange.hour < 0)
                .toList();
        filteredCryptosCurrencies.sort(
          (cryptoA, cryptoB) => cryptoB.latestPrice.percentChange.hour
              .compareTo(cryptoA.latestPrice.percentChange.hour),
        );
        break;
    }
    notifyListeners();
  }

  void filterCryptosByInputUser(String input) {
    final inputLowerCase = input.toLowerCase();
    filteredCryptosCurrencies =
        allCryptosCurrencies
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
      allCryptosCurrencies = await datasource.getCryptos(currency);
      filteredCryptosCurrencies = allCryptosCurrencies;
      setState(ViewState.success);
      notifyListeners();
    } catch (error) {
      setState(ViewState.error, 'Não foi possivel buscar as Criptomoedas');
    }
    notifyListeners();
  }
}
