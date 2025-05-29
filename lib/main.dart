import 'package:crypto_wallet/core/theme/app_theme.dart';
import 'package:crypto_wallet/ui/home/view/home_view.dart';
import 'package:crypto_wallet/ui/welcome/view/welcome_view.dart';
import 'package:flutter/material.dart';

import 'core/dependency injection/setup_providers.dart';

void main() {
  runApp(setupProviders(child: const CryptoWalletApp()));
}

class CryptoWalletApp extends StatelessWidget {
  const CryptoWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Wallet',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeView(),
        '/home': (context) => HomeView(),
      },
    );
  }
}
