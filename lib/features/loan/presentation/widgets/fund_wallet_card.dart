
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FundWalletCard extends StatelessWidget {
  const FundWalletCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 75,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white.withOpacity(.2),
                ),
                child: const Center(
                  child: Icon(
                    Icons.credit_card,
                    color: Colors.white,
                  ),
                ),
              ),
              const Gap(12),
              Text(
                'Fund wallet to repay',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 15,
                  color: theme.colorScheme.surface,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
