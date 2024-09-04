import 'package:flutter/material.dart';

import '../../../../core/presentation/theme/colors/colors.dart';

class ReusableBeneficiariesColumn extends StatelessWidget {
  const ReusableBeneficiariesColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: transparent,
      margin: const EdgeInsets.only(
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: beneficiariesCircleAvatarColour,
            child: Text(
              "IZ",
              style: theme.textTheme.labelMedium!.copyWith(
                fontSize: 12,
                color: theme.colorScheme.surface,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Inosuke",
            textAlign: TextAlign.center,
            style: theme.textTheme.labelSmall!.copyWith(
              fontSize: 10,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "Zenitsu",
            textAlign: TextAlign.center,
            style: theme.textTheme.labelSmall!.copyWith(
              fontSize: 10,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
