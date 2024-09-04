import 'package:flutter/material.dart';

import '../../../../core/presentation/theme/colors/colors.dart';

class ReusableBeneficiaryDetailColumn extends StatelessWidget {
  const ReusableBeneficiaryDetailColumn(
      {super.key, required this.title, required this.label});

  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.labelMedium!
                    .copyWith(fontSize: 14, color: textLightGray),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                label,
                style: theme.textTheme.labelMedium!
                    .copyWith(fontSize: 16, color: darkGreen1),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1,
          color: lightGrayTabBarContainerColor,
        ),
      ],
    );
  }
}
