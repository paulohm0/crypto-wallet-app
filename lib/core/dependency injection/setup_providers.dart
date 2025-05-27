// setup_providers.dart
import 'package:crypto_wallet/core/services/dio_client.dart';
import 'package:crypto_wallet/data/datasource/crypto_datasource.dart';
import 'package:crypto_wallet/ui/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

MultiProvider setupProviders({required Widget child}) {
  final dio = DioClient().dio;
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => HomeViewModel(CryptoDatasource(dio)),
      ),
    ],
    child: child,
  );
}
