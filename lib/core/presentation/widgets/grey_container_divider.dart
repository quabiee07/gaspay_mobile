import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/theme/colors/colors.dart';

class GreyContainerDivider extends StatelessWidget {
  const GreyContainerDivider({super.key, this.height = 10});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: const BoxDecoration(color: backGroundGray),
    );
  }
}
