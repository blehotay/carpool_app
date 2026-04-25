import 'package:flutter/material.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    required this.label,
    this.backgroundColor,
    this.textColor,
    super.key,
  });

  final String label;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: textColor ?? Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
    );
  }
}
