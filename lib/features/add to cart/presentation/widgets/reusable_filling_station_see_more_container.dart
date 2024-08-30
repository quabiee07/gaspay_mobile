import 'package:flutter/material.dart';

import '../../../../core/presentation/theme/colors/colors.dart';


class ReusableFillingStationSeeMoreContainer extends StatelessWidget {
  const ReusableFillingStationSeeMoreContainer({
    super.key,
    required this.firstSvg,
    required this.label,
    required this.secondSvg,
  });

  final Widget firstSvg;
  final String label;
  final Widget secondSvg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: firstSvg,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: orderTabTextDarkGray,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: secondSvg,
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(
          thickness: 1,
          color:lightGray,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
