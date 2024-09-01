import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import '../../../../core/presentation/resources/drawables.dart';
import '../../../../core/presentation/theme/colors/colors.dart';

class ReusableSummaryProductRow extends StatelessWidget {
  const ReusableSummaryProductRow({
    super.key,
    required this.productName,
    required this.productQuantity,
    required this.productSummaryPrice,
    required this.isSvg,
  });

  final String productName;
  final int productQuantity;
  final double productSummaryPrice;
  final bool isSvg;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isSvg
                    ? const SvgImage(
                        asset: checkOutCancelIcon,
                      )
                    : const SizedBox.shrink(),
                isSvg
                    ? const SizedBox(
                        width: 16,
                      )
                    : const SizedBox.shrink(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontSize: 16,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "$productQuantity litres",
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 14,
                        color: mediumGray2,
                      ),
                    )
                  ],
                )
              ],
            ),
            Text(
              "NGN $productSummaryPrice",
              style: theme.textTheme.labelLarge?.copyWith(
                fontSize: 16,
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
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
