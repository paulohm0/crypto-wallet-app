import 'package:crypto_wallet/core/theme/app_theme.dart';
import 'package:crypto_wallet/core/utils/keyboard_focus.dart';
import 'package:crypto_wallet/presentation/home/view/home_view.dart';
import 'package:crypto_wallet/presentation/info_crypto/view/info_crypto_view.dart';
import 'package:crypto_wallet/presentation/login/view/login_view.dart';
import 'package:crypto_wallet/presentation/portfolio/view/portfolio_view.dart';
import 'package:crypto_wallet/presentation/profile/view/profile_view.dart';
import 'package:crypto_wallet/presentation/welcome/view/welcome_view.dart';
import 'package:crypto_wallet/shared/navigation/app_routes.dart';
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
      initialRoute: AppRoutes.welcome,
      routes: {
        AppRoutes.welcome: (context) => WelcomeView(),
        AppRoutes.login: (context) => LoginView(),
        AppRoutes.main: (context) => const MainNavView(),
        AppRoutes.profile: (context) => ProfileView(),
        AppRoutes.home: (context) => HomeView(),
        AppRoutes.infoCrypto: (context) => InfoCryptoView(),
        AppRoutes.portfolio: (context) => PortfolioView(),
      },
    );
  }
}
