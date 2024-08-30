import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaspay_mobile/core/presentation/widgets/custom_image.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';

import '../resources/drawables.dart';

class ReusableFavouriteContainer extends StatelessWidget {
  const ReusableFavouriteContainer({
    super.key,
    required this.fuelStation,
    required this.location,
    required this.status,
    required this.rating,
    required this.isClosed,
  });

  final String location;
  final String fuelStation;
  final String status;
  final String rating;
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(
        left: 4,
        right: 4,
        top: 4,
        bottom: 7,
      ),
      margin: const EdgeInsets.only(
        left: 10,
      ),
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.colorScheme.surface,
      ),
      child: Column(
        children: [
          const CustomImage(asset: fuelPumpSmall),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$fuelStation-$location",
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 8,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SvgImage(
                asset: 'heartIcon ',
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                status,
                style: TextStyle(
                  fontSize: 6,
                  fontWeight: FontWeight.w500,
                  color: isClosed
                      ? theme.colorScheme.error
                      : theme.colorScheme.onSurface,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/starIcon.svg"),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    rating,
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontSize: 6,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
