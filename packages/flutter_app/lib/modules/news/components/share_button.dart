import 'package:flutter/material.dart';

import 'package:news_aggregator/ui/app_ui.dart';

/// {@template share_button}
/// A reusable share button.
/// {@endtemplate}
class ShareButton extends StatelessWidget {
  /// {@macro share_button}
  const ShareButton({
    super.key,
    required this.shareText,
    this.onPressed,
    Color? color,
  }) : _color = color ?? AppColors.black;

  /// The text displayed within share icon.
  final String shareText;

  /// Called when the text field has been tapped.
  final VoidCallback? onPressed;

  /// Color used for button font.
  ///
  /// Defaults to [AppColors.black]
  final Color? _color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton.icon(
      icon: Icon(
        Icons.share,
        color: _color,
      ),
      onPressed: onPressed,
      label: Text(
        shareText,
        style: theme.textTheme.labelLarge?.copyWith(
          color: _color,
        ),
      ),
    );
  }
}
