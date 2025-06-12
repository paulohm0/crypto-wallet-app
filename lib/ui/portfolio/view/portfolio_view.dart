import 'package:crypto_wallet/shared/widgets/app_bar_custom.dart';
import 'package:crypto_wallet/ui/portfolio/widgets/portfolio_action_buttons.dart';
import 'package:crypto_wallet/ui/portfolio/widgets/portfolio_card.dart';
import 'package:flutter/material.dart';

class PortfolioView extends StatefulWidget {
  const PortfolioView({super.key});

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [PortfolioCard(), PortfolioActionButtons()]),
      ),
    );
  }
}
