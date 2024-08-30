import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';

import '../../../../core/presentation/resources/drawables.dart';

class ReusableCustomerRatingsAndCommentColumn extends StatelessWidget {
  const ReusableCustomerRatingsAndCommentColumn(
      {super.key,
      required this.customersName,
      required this.comment,
      required this.date});

  final String customersName;
  final String date;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                customersName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Color(0xFF333333),
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xFF909090),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Row(
            children: [
              SvgImage(asset: bigStarIcon),
              SizedBox(
                width: 4,
              ),
              SvgImage(asset: bigStarIcon),
              SizedBox(
                width: 4,
              ),
              SvgImage(asset: bigStarIcon),
              SizedBox(
                width: 4,
              ),
              SvgImage(asset: bigStarIcon),
              SizedBox(
                width: 4,
              ),
              SvgImage(asset: bigStarIcon),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            comment,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 1,
            color: Color(0xFFD9D9D9),
          )
        ],
      ),
    );
  }
}
