import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A widget to display color information and allow copying the hex value.
class ColorInfo extends StatelessWidget {
  /// current color
  final Color color;

  /// hex value
  final String hex;

  /// Creates a [ColorInfo] widget.
  const ColorInfo({required this.color, required this.hex, super.key});

  Future<void> _copy(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: hex));

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied to clipboard: $hex'),
        duration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _copy(context),
      child: Text(
        hex,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: const Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
