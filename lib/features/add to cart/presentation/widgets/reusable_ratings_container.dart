import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';

class ReusableRatingsContainer extends StatelessWidget {
  const ReusableRatingsContainer({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 6,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: const Color(0xFFD9D9D9),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const  SvgImage(asset: bigStarIcon,),
          const SizedBox(
            width: 2,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xFF002933),
            ),
          )
        ],
      ),
    );
  }
}
