import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingChart extends StatelessWidget {
  const LoadingChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.transparent!,
      highlightColor: Colors.grey[500]!,
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[500]),
        width: 400,
        height: 200,
      ),
    );
  }
}
