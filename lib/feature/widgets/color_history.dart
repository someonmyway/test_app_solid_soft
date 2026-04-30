import 'package:flutter/material.dart';

/// A widget to display a history of colors.
class ColorHistory extends StatelessWidget {
  /// Creates a [ColorHistory] widget.
  const ColorHistory({required this.history, super.key});

  /// A list of colors to display in the history.
  final List<Color> history;

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: history
            .map(
              (color) => Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
