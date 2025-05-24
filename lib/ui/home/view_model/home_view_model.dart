import 'package:crypto_wallet/data/datasource/crypto_datasource.dart';
import 'package:crypto_wallet/data/models/crypto_model.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final CryptoDatasource datasource;
  HomeViewModel(this.datasource) {
    fetchCryptoCurrencies(_currency);
  }

  List<CryptoModel> cryptoCurrencies = [];
  String _currency = 'BRL';
  String get currency => _currency;

  Future<void> fetchCryptoCurrencies(String currency) async {
    try {
      print('🔄 Buscando moedas com base em $currency...');
      _currency = currency;
      cryptoCurrencies = await datasource.getCryptos(currency);
      notifyListeners();
    } catch (error, stack) {
      print('❌ Erro no fetchCryptoCurrencies: $error');
      print('📌 StackTrace: $stack');
    }
  }
}
