import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingChart extends StatelessWidget {
  const LoadingChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.transparent,
      highlightColor: AppColors.grey,
      child: Container(
        decoration: BoxDecoration(color: AppColors.grey),
        width: 400,
        height: 200,
      ),
    );
  }
}
