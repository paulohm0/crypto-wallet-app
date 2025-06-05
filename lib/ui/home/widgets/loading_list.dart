import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingList extends StatelessWidget {
  const LoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[700]!,
            highlightColor: Colors.grey[500]!,
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[500],
                    ),
                    width: double.infinity,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
