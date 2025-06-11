import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:crypto_wallet/ui/info_crypto/utils/filter_label_enum.dart';
import 'package:flutter/material.dart';

class FilterCryptoChart extends StatefulWidget {
  final void Function(FilterChartLabelEnum)? onFilterChanged;
  const FilterCryptoChart({super.key, this.onFilterChanged});

  @override
  State<FilterCryptoChart> createState() => _FilterCryptoChartState();
}

class _FilterCryptoChartState extends State<FilterCryptoChart> {
  FilterChartLabelEnum selectedFilter = FilterChartLabelEnum.dia;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          FilterChartLabelEnum.values.map((filter) {
            final bool isSelected = filter == selectedFilter;

            return SizedBox(
              width: 46,
              height: 40,
              child: TextButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                    isSelected
                        ? AppColors.white.withAlpha(25)
                        : AppColors.transparent,
                  ),
                  overlayColor: WidgetStateProperty.all(
                    AppColors.white.withAlpha(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    selectedFilter = filter;
                  });
                  widget.onFilterChanged?.call(filter);
                },
                child: Text(
                  filter.label,
                  style: TextStyle(
                    color: isSelected ? AppColors.primary : AppColors.white,
                    fontSize: AppFontSizes.xx,
                    fontWeight: AppFontWeights.bold,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
