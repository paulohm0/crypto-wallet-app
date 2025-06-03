import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FilterCryptoChart extends StatelessWidget {
  const FilterCryptoChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 50,
          height: 40,
          child: TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.white.withAlpha(10)),
            ),
            onPressed: () {},
            child: Text(
              '1h',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 50,
          height: 40,
          child: TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.white.withAlpha(10)),
            ),
            onPressed: () {},
            child: Text(
              '24h',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 50,
          height: 40,
          child: TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.white.withAlpha(10)),
            ),
            onPressed: () {},
            child: Text(
              '10',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 50,
          height: 40,
          child: TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.white.withAlpha(10)),
            ),
            onPressed: () {},
            child: Text(
              '1a',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 55,
          height: 40,
          child: TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.white.withAlpha(10)),
            ),
            onPressed: () {},
            child: Text(
              'Tudo',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
