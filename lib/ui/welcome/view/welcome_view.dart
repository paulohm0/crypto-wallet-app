import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColors.black,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 8.0),
              Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      'assets/images/crypto_wallet_icon_welcome.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Crypto',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: AppFontSizes.xll,
                              fontWeight: AppFontWeights.medium,
                            ),
                          ),
                          TextSpan(
                            text: 'Wallet',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: AppFontSizes.xll,
                              fontWeight: AppFontWeights.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Eleve o nível do seu portfólio cripto.',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: AppFontSizes.lg,
                      fontWeight: AppFontWeights.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'O mundo das criptomoedas em um só lugar.',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: AppFontSizes.xs,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/main');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Começar',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: AppFontSizes.sm,
                            fontWeight: AppFontWeights.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
