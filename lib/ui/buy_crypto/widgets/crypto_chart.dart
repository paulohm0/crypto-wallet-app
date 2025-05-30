import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CryptoChart extends StatelessWidget {
  final List<FlSpot> spots;
  const CryptoChart({super.key, required this.spots});

  @override
  Widget build(BuildContext context) {
    if (spots.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final minX = spots.first.x;
    final maxX = spots.last.x;
    final minY = spots.map((e) => e.y).reduce((a, b) => a < b ? a : b);
    final maxY = spots.map((e) => e.y).reduce((a, b) => a > b ? a : b);

    return SizedBox(
      height: 300,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                barWidth: 1,
                color: AppColors.primary,
                dotData: FlDotData(show: false),
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
