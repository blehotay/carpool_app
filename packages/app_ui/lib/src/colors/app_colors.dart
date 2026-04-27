import 'package:flutter/material.dart';

/// Application color palette.
abstract class AppColors {
  /// Primary brand color (teal).
  static const Color primary = Color(0xFF00BFA5);

  /// Secondary brand color (purple).
  static const Color secondary = Color(0xFF7C4DFF);

  /// Background color.
  static const Color background = Color(0xFFF5F5F5);

  /// Surface color.
  static const Color surface = Color(0xFFFFFFFF);

  /// Error color.
  static const Color error = Color(0xFFFF5252);

  /// Text color on primary.
  static const Color onPrimary = Color(0xFFFFFFFF);

  /// Text color on secondary.
  static const Color onSecondary = Color(0xFFFFFFFF);

  /// Text color on background.
  static const Color onBackground = Color(0xFF212121);

  /// Text color on surface.
  static const Color onSurface = Color(0xFF212121);

  /// Text color on error.
  static const Color onError = Color(0xFFFFFFFF);

  /// Purple accent color.
  static const Color purple = Color(0xFF7C4DFF);

  /// Light purple accent.
  static const Color lightPurple = Color(0xFFE1BEE7);

  /// Orange accent color.
  static const Color orange = Color(0xFFFF9800);

  /// Light orange accent.
  static const Color lightOrange = Color(0xFFFFE0B2);

  /// Grey neutral color.
  static const Color grey = Color(0xFF9E9E9E);

  /// Light grey neutral.
  static const Color lightGrey = Color(0xFFE0E0E0);

  /// Success state color.
  static const Color success = Color(0xFF4CAF50);

  /// Warning state color.
  static const Color warning = Color(0xFFFF9800);
}
