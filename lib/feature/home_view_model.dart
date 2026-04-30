import 'package:flutter/material.dart';
import 'package:test_app_solid_soft/utils/color_generator.dart';

/// home page view model
class HomeViewModel extends ChangeNotifier {
  static const _maxHistoryLength = 5;
  static const _hexLength = 8;
  static const _radixString = 16;

  Color _backgroundColor = Colors.white;
  final List<Color> _history = [];

  /// Gets the current background color.
  Color get backgroundColor => _backgroundColor;

  /// Gets the color history.
  List<Color> get history => List.unmodifiable(_history);

  /// Gets the current color in hex-adecimal format.
  String get currentColorHex {
    final hex = _backgroundColor
        .toARGB32()
        .toRadixString(_radixString)
        .padLeft(_hexLength, '0')
        .toUpperCase();

    return '#$hex';
  }

  /// Changes the background color to a random color.
  void changeBackgroundColor() {
    _backgroundColor = ColorGenerator.randomColor();

    _history.insert(0, _backgroundColor);
    if (history.length > _maxHistoryLength) {
      _history.removeLast();
    }

    notifyListeners();
  }
}
