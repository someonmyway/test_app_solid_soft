import 'dart:math';
import 'package:flutter/material.dart';

/// Random Color Generator
final class ColorGenerator {
  static const _maxColorValue = 256;
  static const _alpha = 255;

  static final Random _random = Random();

  ColorGenerator._();

  /// Generates a random color.
  static Color randomColor() {
    return Color.fromARGB(
      _alpha,
      _random.nextInt(_maxColorValue),
      _random.nextInt(_maxColorValue),
      _random.nextInt(_maxColorValue),
    );
  }
}
