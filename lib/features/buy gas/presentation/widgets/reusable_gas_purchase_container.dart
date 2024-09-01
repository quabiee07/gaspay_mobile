import 'package:flutter/material.dart';

class ReusableGasPurchaseContainer extends StatelessWidget {
  const ReusableGasPurchaseContainer({
    super.key,
    required this.product,
    required this.amount,
  });

  final String product;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFFEDECEC)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            product,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF002933).withOpacity(0.50),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "NGN $amount/kg",
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF002933).withOpacity(0.50),
            ),
          )
        ],
      ),
    );
  }
}
