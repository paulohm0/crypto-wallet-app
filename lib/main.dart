import 'package:crypto_wallet/core/services/dio_client.dart';
import 'package:crypto_wallet/data/datasource/crypto_datasource.dart';
import 'package:crypto_wallet/ui/home/view/home_view.dart';
import 'package:crypto_wallet/ui/home/view_model/home_view_model.dart';
import 'package:crypto_wallet/ui/welcome/view/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final dio = DioClient().dio;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(CryptoDatasource(dio)),
        ),
      ],
      child: const CryptoWalletApp(),
    ),
  );
}

class CryptoWalletApp extends StatelessWidget {
  const CryptoWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: Colors.black,
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeView(),
        '/home': (context) => HomeView(),
      },
    );
  }
}
