import 'package:crypto_wallet/core/theme/app_theme.dart';
import 'package:crypto_wallet/core/utils/keyboard_focus.dart';
import 'package:crypto_wallet/presentation/home/view/home_view.dart';
import 'package:crypto_wallet/presentation/info_crypto/view/info_crypto_view.dart';
import 'package:crypto_wallet/presentation/login/view/login_view.dart';
import 'package:crypto_wallet/presentation/portfolio/view/portfolio_view.dart';
import 'package:crypto_wallet/presentation/profile/view/profile_view.dart';
import 'package:crypto_wallet/presentation/welcome/view/welcome_view.dart';
import 'package:crypto_wallet/shared/navigation/main_nav_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/di/setup_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(setupProviders(child: const CryptoWalletApp()));
}

class CryptoWalletApp extends StatelessWidget {
  const CryptoWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Wallet',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [KeyboardDismissObserver()],
      theme: AppTheme.theme,
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeView(),
        '/login': (context) => LoginView(),
        '/main': (context) => const MainNavView(),
        '/profile': (context) => ProfileView(),
        '/home': (context) => HomeView(),
        '/infocripto': (context) => InfoCryptoView(),
        '/portfolio': (context) => PortfolioView(),
      },
    );
  }
}
