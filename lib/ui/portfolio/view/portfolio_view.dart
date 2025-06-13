import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PortfolioCard(),
            PortfolioActionButtons(),
            SizedBox(height: 8.0),
            Text(
              'Seus ativos',
              style: TextStyle(
                color: AppColors.white,
                fontSize: AppFontSizes.sm,
                fontWeight: AppFontWeights.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
