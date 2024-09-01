import 'package:flutter/material.dart';
import '../../../../core/presentation/theme/colors/colors.dart';

class ReusableHorizontalDivider extends StatelessWidget {
  const ReusableHorizontalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 2,
      color:horizontalDividerColor,
    );
  }
}
