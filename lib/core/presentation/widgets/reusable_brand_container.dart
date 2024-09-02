import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/widgets/custom_image.dart';

import '../../../features/featured brands/presentation/screens/featured_filling_station_screen.dart';

class ReusableBrandContainer extends StatelessWidget {
  const ReusableBrandContainer({
    super.key,
    required this.label,
    required this.imagePath,
    required this.color,
    required this.imagePathOpacity,
    this.imagePadding = 0.00,
  });

  final String label;
  final Color color;
  final String imagePath;
  final double imagePathOpacity;
  final double imagePadding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const FeaturedFillingStationScreen(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8,
          ),
          color: color.withOpacity(imagePathOpacity),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: imagePadding),
              child: CustomImage(
                asset: imagePath,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                fontSize: 12,
                color: theme.colorScheme.onSurface,
              ),
            )
          ],
        ),
      ),
    );
  }
}
