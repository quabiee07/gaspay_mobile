import 'package:flutter/material.dart';
import 'package:gaspay_mobile/features/checkout/presentation/screens/check_out_screen.dart';

import '../../../../core/presentation/theme/colors/colors.dart';

class ReusableGasPurchaseContainer extends StatelessWidget {
  const ReusableGasPurchaseContainer({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12,),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: product.addedToCart?Border.all(
            width: 0.5,
            color: blueTabBarContainerColor,
          ):const Border(),
          color:  product.addedToCart? petroleumProductActiveColor:lightGrayTabBarContainerColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            product.name,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color:product.addedToCart? const Color(0xFF002933):const Color(0xFF002933).withOpacity(0.50),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "NGN ${product.price}/kg",
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w700,
              color:product.addedToCart? const Color(0xFF002933): const Color(0xFF002933).withOpacity(0.50),
            ),
          )
        ],
      ),
    );
  }
}
