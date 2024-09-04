import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/colors/colors.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.title,
    this.isLoading = false,
    required this.onPressed,
    this.isEnabled = true,
    this.width,
    this.height,
    this.icon,
    this.isIcon = false,
    this.buttonColor,
    this.verticalPadding,
  });

  final String title;
  final bool isLoading;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final bool isEnabled;
  final Widget? icon;
  final bool isIcon;
  final Color? buttonColor;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: height ?? 58,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  24,
                ),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(
                buttonColor ?? blueTabBarContainerColor)),
        onPressed: isEnabled ? onPressed : null,
        child: isLoading == true
            ? CupertinoActivityIndicator(
                color: theme.colorScheme.surface,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  isIcon
                      ? const SizedBox(
                          width: 6,
                        )
                      : const SizedBox.shrink(),
                  Text(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                      color: theme.colorScheme.surface,
                    ),
                  ),
                ],
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
    this.buttonBorderColor,
  });

  final String title;
  final bool isLoading;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final bool isEnabled;
  final Color? buttonBorderColor;

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
            color: buttonBorderColor ??
                theme.colorScheme.secondary, // Border color
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              28,
            ), // Circular border radius
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
                  fontSize: 16,
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
