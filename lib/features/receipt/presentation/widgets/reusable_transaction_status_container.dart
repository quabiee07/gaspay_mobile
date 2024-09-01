import 'package:flutter/material.dart';

class ReusableTransactionStatusContainer extends StatelessWidget {
  const ReusableTransactionStatusContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF23A26D).withOpacity(0.12),
        borderRadius: BorderRadius.circular(23),
      ),
      child: const Text(
        "Success",
        style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: Color(0xFF23A26D)),
      ),
    );
  }
}
