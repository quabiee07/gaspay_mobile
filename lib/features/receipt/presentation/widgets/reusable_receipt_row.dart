import 'package:flutter/material.dart';

class ReusableReceiptRow extends StatelessWidget {
  const ReusableReceiptRow({
    super.key,
    required this.isTailingText,
    required this.leadingText,
    required this.tailingText,
    this.widget,
    this.color,
  });

  final String leadingText;
  final String tailingText;
  final bool isTailingText;
  final Widget? widget;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leadingText,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0xFF909090)),
        ),
        isTailingText
            ? Text(
          tailingText,
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 14, color: color),
        )
            : widget ?? const SizedBox.shrink(),
      ],
    );
  }
}
