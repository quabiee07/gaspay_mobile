import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:gaspay_mobile/features/add%20to%20cart/presentation/screens/ratings_screen.dart';
import '../../../../core/presentation/resources/drawables.dart';
import '../../../../core/presentation/theme/colors/colors.dart';
import '../../../../core/presentation/widgets/reusable_back_button_with_title.dart';
import '../widgets/reusable_filling_station_see_more_container.dart';

class FeaturedFillingStationSeeMoreScreen extends StatelessWidget {
  const FeaturedFillingStationSeeMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableBackButtonWithTitle(
                title: "Total Filling Station",
                isText: true,
                onTap: () {
                  Navigator.pop(context);
                },
                isBackIconVisible: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Smith Roundabout",
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.surface,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Opens 9:00 am - 9:00pm",
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 14,
                  color: orderTabTextDarkGray,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "40 - 50 mins away",
                style: theme.textTheme.labelMedium
                    ?.copyWith(fontSize: 12, color: orderTabTextDarkGray),
              ),
              const SizedBox(
                height: 32,
              ),
              const ReusableFillingStationSeeMoreContainer(
                firstSvg: SvgImage(
                  asset: locationIcon,
                ),
                label:
                    '10 Creighton Bank Heights Avenue, Lagos 102345, Lagos, Nigeria',
                secondSvg: SvgImage(asset: mapIcon),
              ),
              const ReusableFillingStationSeeMoreContainer(
                firstSvg: SvgImage(
                  asset: worldIcon,
                ),
                label: 'Share with friends and family',
                secondSvg: SvgImage(asset: purpleShareIcon),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Rating",
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SvgImage(
                        asset: bigStarIcon,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "4.0 (39 reviews)",
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontSize: 14,
                          color: orderTabTextDarkGray,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RatingsScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "See all",
                      style: theme.textTheme.labelMedium?.copyWith(
                          fontSize: 14, color: blueTabBarContainerColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
