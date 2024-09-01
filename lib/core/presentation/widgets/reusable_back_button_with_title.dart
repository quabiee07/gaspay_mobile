import 'package:flutter/material.dart';

import '../theme/colors/colors.dart';


class ReusableBackButtonWithTitle extends StatelessWidget {
  const ReusableBackButtonWithTitle({
    super.key,
    required this.isText,
    required this.title,
    this.suffixWidget,
    required this.onTap,
    required this.isBackIconVisible,
    this.prefixWidget,
  });

  final String title;
  final bool isText;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final Function() onTap;
  final bool isBackIconVisible;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: isBackIconVisible
              ?  Row(
            children: [
             const Icon(
                Icons.arrow_back_ios,
                color: mediumGray,
              ),
              Text(
                "Back",
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 16,
                  color: darkGray,
                ),
              ),
            ],
          )
              : prefixWidget,
        ),
        isText
            ? Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelLarge?.copyWith(
              fontSize: 16,
              color: theme.colorScheme.onSurface,
            ),
          ),
        )
            : const SizedBox.shrink(),
        Builder(
          builder: (context) {
            if (suffixWidget != null) {
              return suffixWidget!;
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
