import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/widgets/clickable.dart';

class AccountTypeCard extends StatelessWidget {
  const AccountTypeCard({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  });

  final String? isSelected;
  final String title;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Clickable(
      onPressed: () {
        onTap(title.toLowerCase());
      },
      child: Container(
        height: 80,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFF0F0F0)),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFFEFEFEF).withOpacity(.64),
                  blurRadius: 16,
                  offset: const Offset(0, 1))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: isSelected?.toLowerCase() == title.toLowerCase()
                        ? 5
                        : 1,
                    color: isSelected?.toLowerCase() == title.toLowerCase()
                        ? theme.colorScheme.primary
                        : const Color(0xFFF0F0F0)),
              ),
            ),
            const Gap(12),
            Text(
              title,
              style: theme.textTheme.displaySmall?.copyWith(
                fontSize: 14,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
