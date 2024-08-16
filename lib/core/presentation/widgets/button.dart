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
      height: height ?? 58,
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

class BorderButton extends StatelessWidget {
  const BorderButton({
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
      child: OutlinedButton(
        onPressed: isEnabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 1.5,
            color: theme.colorScheme.secondary, // Border color
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28), // Circular border radius
          ),
          backgroundColor: Colors.white, // Background color
        ),
        child: isLoading == true
            ? CupertinoActivityIndicator(
                color: theme.colorScheme.surface,
              )
            : Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 14,
                  color: theme.colorScheme.onSurface,
                ),
              ),
      ),
    );
  }
}
