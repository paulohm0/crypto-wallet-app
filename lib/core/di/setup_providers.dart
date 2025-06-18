import 'package:crypto_wallet/core/services/firebase/firebase_client.dart';
import 'package:crypto_wallet/core/services/network/dio_client.dart';
import 'package:crypto_wallet/data/datasource/api/crypto_datasource.dart';
import 'package:crypto_wallet/data/datasource/api/prices_chart_datasource.dart';
import 'package:crypto_wallet/presentation/home/view_model/home_view_model.dart';
import 'package:crypto_wallet/presentation/info_crypto/view_model/info_crypto_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

MultiProvider setupProviders({required Widget child}) {
  final dio = DioClient().dio;
  final firebaseClient = FirebaseClient();

  return MultiProvider(
    providers: [
      Provider<FirebaseClient>.value(value: firebaseClient),
      ChangeNotifierProvider(
        create: (_) => HomeViewModel(CryptoDatasource(dio), firebaseClient),
      ),
      ChangeNotifierProvider(
        create: (_) => InfoCryptoViewModel(PricesChartDatasource(dio)),
      ),
    ],
    child: child,
  );
}
