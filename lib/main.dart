import 'package:crypto_wallet/ui/welcome/view/welcome_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CryptoWalletApp());
}

class CryptoWalletApp extends StatelessWidget {
  const CryptoWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      initialRoute: '/welcome',
      routes: {'/welcome': (context) => WelcomeView()},
    );
  }
}
