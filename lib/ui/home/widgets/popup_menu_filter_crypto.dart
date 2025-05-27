import 'package:flutter/material.dart';

enum HomeFilterCrypto {
  high('↑ Alta'),
  low('↓ Baixa'),
  all('All');

  final String label;
  const HomeFilterCrypto(this.label);
}

class PopupMenuFilterCrypto extends StatefulWidget {
  final HomeFilterCrypto selectedFilter;
  final void Function(HomeFilterCrypto) onFilterChanged;
  const PopupMenuFilterCrypto({
    super.key,
    required this.onFilterChanged,
    required this.selectedFilter,
  });

  @override
  State<PopupMenuFilterCrypto> createState() => _PopupMenuFilterCryptoState();
}

class _PopupMenuFilterCryptoState extends State<PopupMenuFilterCrypto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: SegmentedButton<HomeFilterCrypto>(
        segments:
            HomeFilterCrypto.values
                .map(
                  (segment) => ButtonSegment<HomeFilterCrypto>(
                    value: segment,
                    label: Text(
                      segment.label,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
                .toList(),
        selected: {widget.selectedFilter},
        onSelectionChanged: (Set<HomeFilterCrypto> styles) {
          widget.onFilterChanged(styles.first);
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.selected)) {
              return const Color(0xFFFEB83D);
            }
            return const Color(0xFF1E1E1E);
          }),
          foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.black;
            }
            return const Color(0xFFFEB83D);
          }),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          side: WidgetStateProperty.all(
            const BorderSide(color: Color(0xFFFEB83D), width: 0.8),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
        showSelectedIcon: false,
      ),
    );
  }
}
