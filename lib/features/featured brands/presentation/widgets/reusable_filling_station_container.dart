import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/widgets/custom_image.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';

import '../../../../core/presentation/resources/drawables.dart';
import '../../../../core/presentation/theme/colors/colors.dart';

class ReusableFillingStationContainer extends StatelessWidget {
  const ReusableFillingStationContainer({
    super.key,
    required this.location,
    required this.status,
    required this.rating,
    required this.onTap,
  });

  final String location;
  final String status;
  final String rating;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 8,
          bottom: 10,
        ),
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8,
          ),
          color: borderLightGray,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(
                    8,
                  ),
                  topRight: Radius.circular(
                    8,
                  ),
                ),
                color: totalPink.withOpacity(
                  0.20,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 28,
                    ),
                    child: CustomImage(
                      asset: bigTotalLogo,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  location,
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontSize: 14,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SvgImage(
                  asset: emptyHeartIcon,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(status,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontSize: 14,
                      color: theme.colorScheme.onSurface,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SvgImage(
                      asset: bigStarIcon,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(rating,
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontSize: 12,
                          color: theme.colorScheme.onSurface,
                        )),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
