import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';

import '../theme/colors/colors.dart';

class ReusableCurrentPriceContainer extends StatelessWidget {
  const ReusableCurrentPriceContainer({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productStatusContainerColor,
    required this.productStatusTextColor,
    required this.productStatusIcon,
    required this.productStatusNumber,
  });

  final String productName;
  final String productPrice;
  final String productStatusNumber;
  final Color productStatusContainerColor;
  final Color productStatusTextColor;
  final String productStatusIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: borderColorExtraLightGray,
        ),
        boxShadow: [
          BoxShadow(
            color: shadowDarkGray.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: theme.textTheme.labelMedium?.copyWith(
              fontSize: 12,
              color: textDarkGray1,
            ),
          ),
          const Gap(4),
          Row(
            children: [
              Text(
                productPrice,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontSize: 12,
                  color: textDarkGray2,
                ),
              ),
              const Gap(8),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: productStatusContainerColor,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Row(
                  children: [
                    SvgImage(asset: productStatusIcon),
                    const Gap(2),
                    Text(
                      productStatusNumber,
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 8,
                        color: productStatusTextColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
