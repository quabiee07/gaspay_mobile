import 'package:flutter/material.dart';
import 'package:gaspay_mobile/features/checkout/presentation/screens/beneficiaries_details_screen.dart';

import '../../../../core/presentation/theme/colors/colors.dart';

class ReusableBeneficiariesContainer extends StatelessWidget {
  const ReusableBeneficiariesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const BeneficiariesDetailsScreen(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(
          bottom: 16,
        ),
        color: transparent,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: beneficiariesCircleAvatarColour,
                  child: Text(
                    "IZ",
                    style: theme.textTheme.labelMedium!.copyWith(
                      fontSize: 16,
                      color: theme.colorScheme.surface,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Inosuke Zenitsu",
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontSize: 14,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              thickness: 1,
              color: lightGrayTabBarContainerColor,
            ),
          ],
        ),
      ),
    );
  }
}
