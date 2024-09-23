import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/pop_widget.dart';

class ReusableBackButtonWithTitle extends StatelessWidget {
  const ReusableBackButtonWithTitle({
    super.key,
    required this.isText,
    required this.title,
    this.suffixWidget,
    this.onTap,
    required this.isBackIconVisible,
    this.prefixWidget,
  });

  final String title;
  final bool isText;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final Function()? onTap;
  final bool isBackIconVisible;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isBackIconVisible
                ? PopWidget(
                    callback: () {
                      context.pop();
                    },
                  )
                : const SizedBox(),
          ],
        ),
        Center(
          child: isText
              ? Text(
                  title,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontSize: 16,
                    color: theme.colorScheme.onSurface,
                  ),
                )
              : const SizedBox(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            suffixWidget ??
                const SizedBox(
                    width: 48), // Reserve space if suffixWidget is null
          ],
        ),
      ],
    );
  }
}
