import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ListTileWithCheck extends StatelessWidget {
  const ListTileWithCheck({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.onSurface,
              ),
              child: Center(
                child: Icon(
                  Icons.check_rounded,
                  color: theme.colorScheme.surface,
                  size: 12,
                ),
              ),
            ),
            const Gap(5),
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: 14,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
        const Gap(5),
        Text(
          description,
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 12,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
