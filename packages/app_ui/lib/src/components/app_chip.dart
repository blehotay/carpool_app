import 'package:flutter/material.dart';

/// A customizable chip widget for displaying labels.
class AppChip extends StatelessWidget {
  /// Creates an [AppChip].
  const AppChip({
    required this.label,
    this.backgroundColor,
    this.textColor,
    super.key,
  });

  /// The text label to display.
  final String label;

  /// Optional background color. Defaults to theme primary container.
  final Color? backgroundColor;

  /// Optional text color. Defaults to theme on primary container.
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelMedium?.copyWith(
          color: textColor ?? theme.colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
