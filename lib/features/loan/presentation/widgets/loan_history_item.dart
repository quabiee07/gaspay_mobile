import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/clickable.dart';
import 'package:gaspay_mobile/features/loan/presentation/screens/loan_history_details.dart';

class LoanHistoryItem extends StatelessWidget {
  const LoanHistoryItem({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Clickable(
      onPressed: () {
        context.push(const LoanHistoryDetails());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.secondary),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NGN 300,000.00',
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: 14,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '31-08-2024',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontSize: 11,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                Text(
                  index == -1 ? 'Default' : 'Active',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 15,
                    color: index == -1
                        ? const Color(0xFFF46A2B)
                        : const Color(0xFF05AF16),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
