import 'package:crypto_wallet/core/services/dio_client.dart';
import 'package:crypto_wallet/data/datasource/crypto_datasource.dart';
import 'package:crypto_wallet/data/datasource/prices_chart_datasource.dart';
import 'package:crypto_wallet/ui/home/view_model/home_view_model.dart';
import 'package:crypto_wallet/ui/info_crypto/view_model/info_crypto_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

MultiProvider setupProviders({required Widget child}) {
  final dio = DioClient().dio;
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => HomeViewModel(CryptoDatasource(dio)),
      ),
      ChangeNotifierProvider(
        create: (_) => InfoCryptoViewModel(PricesChartDatasource(dio)),
      ),
    ],
    child: child,
  );
}
