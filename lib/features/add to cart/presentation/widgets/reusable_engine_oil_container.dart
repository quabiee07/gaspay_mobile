import 'package:flutter/material.dart';
import '../../../../core/presentation/theme/colors/colors.dart';
import '../screens/portions/engine_oil_portion.dart';

class ReusableEngineOilContainer extends StatelessWidget {
  const ReusableEngineOilContainer({
    super.key,
    required this.product,
    required this.addToCart,
    required this.addQuantity,
    required this.removeQuantity,
  });

  final EngineProduct product;
  final VoidCallback addToCart;
  final VoidCallback addQuantity;
  final VoidCallback removeQuantity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 16,
      ),
      color: transparent,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                product.image,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontSize: 12,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "NGN ${product.price}/ltr",
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontSize: 14,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  product.addedToCart
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: removeQuantity,
                              child: const CircleAvatar(
                                radius: 20,
                                backgroundColor: circleAvatarLightGray,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.minimize,
                                      color: blueTabBarContainerColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            if (product.addedToCart == true)
                              Text(
                                product.quantity.toString(),
                                style: theme.textTheme.labelLarge?.copyWith(
                                  fontSize: 14,
                                  color: theme.colorScheme.onSecondary,
                                ),
                              ),
                            const SizedBox(
                              width: 7,
                            ),
                            GestureDetector(
                              onTap: addQuantity,
                              child: const CircleAvatar(
                                radius: 20,
                                backgroundColor: circleAvatarLightGray,
                                child: Icon(
                                  Icons.add,
                                  color: blueTabBarContainerColor,
                                ),
                              ),
                            ),
                          ],
                        )
                      : GestureDetector(
                          onTap: addToCart,
                          child: Text("Add to Cart",
                              style: theme.textTheme.labelLarge?.copyWith(
                                  fontSize: 12,
                                  color: blueTabBarContainerColor)),
                        )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            thickness: 1,
            color: lightGrayTabBarContainerColor,
          )
        ],
      ),
    );
  }
}
