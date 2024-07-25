import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.title,
    this.isLoading = false,
    required this.onPressed,
    this.isEnabled = true,
    this.width,
    this.height,
  });

  final String title;
  final bool isLoading;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: height ?? 48,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        child: isLoading == true
            ? CupertinoActivityIndicator(
                color: theme.colorScheme.surface,
              )
            : Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 14,
                  color: theme.colorScheme.surface,
                ),
              ),
      ),
    );
  }
}
