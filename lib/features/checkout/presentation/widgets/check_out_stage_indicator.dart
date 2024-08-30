import 'package:flutter/material.dart';

import '../../../../core/presentation/theme/colors/colors.dart';

class CheckOutStageIndicator extends StatelessWidget {
  const CheckOutStageIndicator({
    super.key,
    required this.index,
    required this.position,
    required this.horizontal,
    required this.isSecondPosition,
    required this.label,
  });

  final int position;
  final int index;
  final double horizontal;
  final bool isSecondPosition;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 2,
              horizontal: horizontal,
            ),
            decoration: BoxDecoration(
              color:
                  index >= position ? blueTabBarContainerColor : indicatorGray,
            ),
          ),
        ),
        isSecondPosition
            ? CircleAvatar(
                radius: 18,
                backgroundColor: index >= position
                    ? blueTabBarContainerColor
                    : indicatorGray,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: index >= position
                      ? blueTabBarContainerColor
                      : theme.colorScheme.surface,
                  child: Text(
                    label,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontSize: 14,
                      color: index >= position
                          ? theme.colorScheme.surface
                          : mediumGray2,
                    ),
                  ),
                ),
              )
            : CircleAvatar(
                radius: 18,
                backgroundColor: index >= position
                    ? blueTabBarContainerColor
                    : indicatorGray,
                child: Text(
                  label,
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontSize: 14,
                    color: theme.colorScheme.surface,
                  ),
                ),
              ),
        isSecondPosition
            ? Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: index >= position
                      ? blueTabBarContainerColor
                      : indicatorGray,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
