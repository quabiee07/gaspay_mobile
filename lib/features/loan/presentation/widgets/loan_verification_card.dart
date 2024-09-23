import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/theme/colors/colors.dart';
import 'package:gaspay_mobile/core/presentation/widgets/clickable.dart';

class LoanVerificationCard extends StatelessWidget {
  const LoanVerificationCard({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    required this.onTap,
  });
  final int number;
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Clickable(
      onPressed: () {
        onTap();
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF484848).withOpacity(.1),
              offset: const Offset(0, 2),
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: double.maxFinite,
              padding: const EdgeInsets.all(14),
              color: cardTop,
              child: Row(
                children: [
                  Container(
                    height: 22,
                    width: 22,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.onSurface),
                    child: Center(
                      child: Text(
                        number.toString(),
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: 12,
                          color: theme.colorScheme.surface,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 14,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const Gap(6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        description,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 12,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const Gap(16),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: theme.colorScheme.primary,
                        size: 12,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
