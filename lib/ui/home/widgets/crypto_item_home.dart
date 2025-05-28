import 'package:crypto_wallet/core/utils/formater_crypto_amount.dart';
import 'package:flutter/material.dart';

class CryptoItemHome extends StatelessWidget {
  final String iconAssetPath;
  final String name;
  final String symbol;
  final String amount;
  final double percentChangeLastHour;
  final String currencySymbol;
  const CryptoItemHome({
    super.key,
    required this.name,
    required this.symbol,
    required this.iconAssetPath,
    required this.amount,
    required this.percentChangeLastHour,
    required this.currencySymbol,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          iconAssetPath,
          width: 30,
          height: 30,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/images/default_icon_image.jpg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            );
          },
        ),
        const SizedBox(width: 12),

        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                symbol,
                style: TextStyle(fontSize: 10, color: Colors.grey[400]),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                amount.toCurrency(currencySymbol),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  percentChangeLastHour < 0
                      ? Icon(Icons.arrow_downward, color: Colors.red, size: 12)
                      : percentChangeLastHour == 0.0
                      ? SizedBox()
                      : Icon(Icons.arrow_upward, color: Colors.green, size: 12),
                  percentChangeLastHour == 0.0
                      ? Text(
                        'Não Informado',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )
                      : Text(
                        '${percentChangeLastHour.toStringAsFixed(5)} %',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color:
                              percentChangeLastHour < 0
                                  ? Colors.red
                                  : Colors.green,
                        ),
                      ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
