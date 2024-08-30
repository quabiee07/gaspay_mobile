import 'package:flutter/material.dart';

class CustomStrokedButton extends StatelessWidget {
  const CustomStrokedButton({
    super.key,
    required this.verticalPadding,
    required this.horizontalPadding,
    required this.textColor,
    required this.label,
    required this.borderColor,
    required this.onTap,
    required this.borderRadius,
    this.suffixWidget,
    required this.fontWeight,
    required this.fontSize,
  });

  final double verticalPadding;
  final double horizontalPadding;
  final String label;
  final Color textColor;
  final Color borderColor;
  final Function() onTap;
  final double borderRadius;
  final Widget? suffixWidget;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
          border: Border.all(
            width: 1,
            color: borderColor,
          ),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
            suffixWidget ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
