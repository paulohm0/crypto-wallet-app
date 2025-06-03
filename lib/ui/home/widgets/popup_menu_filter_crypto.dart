import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:flutter/material.dart';

enum HomeFilterCrypto {
  high('↑ Alta'),
  low('↓ Baixa'),
  all('Todos');

  final String label;
  const HomeFilterCrypto(this.label);
}

class PopupMenuFilterCrypto extends StatelessWidget {
  final HomeFilterCrypto selectedFilter;
  final void Function(HomeFilterCrypto) onFilterChanged;

  const PopupMenuFilterCrypto({
    super.key,
    required this.onFilterChanged,
    required this.selectedFilter,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<HomeFilterCrypto>(
      segments:
          HomeFilterCrypto.values
              .map(
                (segment) => ButtonSegment<HomeFilterCrypto>(
                  value: segment,
                  label: Text(
                    segment.label,
                    style: const TextStyle(
                      fontSize: AppFontSizes.ss,
                      fontWeight: AppFontWeights.bold,
                    ),
                  ),
                ),
              )
              .toList(),
      selected: {selectedFilter},
      onSelectionChanged: (Set<HomeFilterCrypto> filter) {
        onFilterChanged(filter.first);
      },
      style: _segmentedButtonStyle(),
      showSelectedIcon: false,
    );
  }
}

ButtonStyle _segmentedButtonStyle() {
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color?>(
      (states) =>
          states.contains(WidgetState.selected)
              ? AppColors.primary
              : AppColors.greyBackground,
    ),
    foregroundColor: WidgetStateProperty.resolveWith<Color?>(
      (states) =>
          states.contains(WidgetState.selected)
              ? AppColors.black
              : AppColors.primary,
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
    side: WidgetStateProperty.all(
      const BorderSide(color: AppColors.primary, width: 0.8),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    ),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
  );
}
