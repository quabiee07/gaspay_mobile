
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/theme/colors/colors.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/clickable.dart';

class ModalHeader extends StatelessWidget {
  const ModalHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 65,
      color: cardTop,
      child: Column(
        children: [
          const Gap(4),
          Center(
            child: Container(
              width: 36,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFF3c3c43).withOpacity(.3),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          const Gap(24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Clickable(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    'Cancel',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 14,
                      color: const Color(0xFFCA3F00),
                    ),
                  ),
                ),
                const Gap(40),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 12,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const Spacer(),
                const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
