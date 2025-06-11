import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/ui/info_crypto/widgets/loading_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CryptoChart extends StatelessWidget {
  final List<FlSpot> spots;
  const CryptoChart({super.key, required this.spots});

  @override
  Widget build(BuildContext context) {
    if (spots.isEmpty) {
      return const LoadingChart();
    }

    final minX = spots.first.x;
    final maxX = spots.last.x;
    final minY = spots.map((e) => e.y).reduce((a, b) => a < b ? a : b);
    final maxY = spots.map((e) => e.y).reduce((a, b) => a > b ? a : b);

    return SizedBox(
      height: 200,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                curveSmoothness: 0.2,
                spots: spots,
                barWidth: 1.0,
                color: AppColors.primary,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: AppColors.primary.withAlpha(25),
                ),
              ),
            ],
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                  reservedSize: 30,
                  interval: (maxX - minX) / 5,
                  getTitlesWidget: (value, meta) {
                    return Text(value.toInt().toString());
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                  reservedSize: 30,
                  interval: (maxY - minY) / 4,
                  getTitlesWidget: (value, meta) {
                    return Text(value.toInt().toString());
                  },
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(show: true),
            gridData: FlGridData(show: false),
            minX: minX,
            maxX: maxX,
            minY: minY,
            maxY: maxY,
          ),
        ),
      ),
    );
  }
}
