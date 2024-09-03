import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/widgets/custom_image.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import '../../../../core/presentation/resources/drawables.dart';
import '../../../../core/presentation/theme/colors/colors.dart';
import '../screens/portions/all_portion.dart';

class ReusableFillingStationContainer extends StatelessWidget {
  const ReusableFillingStationContainer({
    super.key,
    required this.onTap,
    required this.isLikedOnTap,
    required this.featuredBrands,
  });

  final FeaturedBrands featuredBrands;
  final Function() onTap;
  final VoidCallback isLikedOnTap;

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 28,
                    ),
                    child: CustomImage(
                      asset: featuredBrands.image,
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
                  featuredBrands.location,
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontSize: 14,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                GestureDetector(
                  onTap: isLikedOnTap,
                  child: featuredBrands.isLiked
                      ? const SvgImage(
                          asset: bigHeartIcon,
                        )
                      : const SvgImage(
                          asset: emptyHeartIcon,
                        ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(featuredBrands.status,
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
                    Text(featuredBrands.rating,
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
