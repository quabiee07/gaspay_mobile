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



class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shadowColor: WidgetStateProperty.all(const Color(0xFF7A7A7A)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              24,
            ),
          ),
        ),
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all(
          const Color(0xFF1875F7),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 40,
          ),
        ),
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
