import 'package:crypto_wallet/core/utils/view_state_enum.dart';
import 'package:crypto_wallet/data/datasource/crypto_datasource.dart';
import 'package:crypto_wallet/data/models/crypto_model.dart';
import 'package:crypto_wallet/shared/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  final CryptoDatasource datasource;
  HomeViewModel(this.datasource) {
    fetchCryptoCurrencies(_currency);
  }

  List<CryptoModel> cryptoCurrencies = [];
  String _currency = 'BRL';
  String get currency => _currency;

  Future<void> fetchCryptoCurrencies(String currency) async {
    try {
      setState(ViewState.loading);
      _currency = currency;
      cryptoCurrencies = await datasource.getCryptos(currency);
      setState(ViewState.success);
      notifyListeners();
    } catch (error) {
      setState(ViewState.error, 'Não foi possivel buscar as Criptomoedas');
    }
    notifyListeners();
  }
}
