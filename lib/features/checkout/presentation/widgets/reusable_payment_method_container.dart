import 'package:flutter/material.dart';

import '../../../../core/presentation/theme/colors/colors.dart';
import 'custom_stroked_button.dart';


class ReusablePaymentMethodContainer extends StatelessWidget {
  const ReusablePaymentMethodContainer({
    super.key,
    required this.title,
    required this.buttonLabel,
    required this.description,
    required this.customButtonOnTap,
    required this.onTap,
    required this.isDescription,
    required this.isCustomButtonVisible,
    required this.isClicked,
    required this.widget,
    required this.value,
    required this.groupValue,
  });

  final String title;
  final String description;
  final String buttonLabel;
  final Function() customButtonOnTap;
  final ValueChanged<dynamic> onTap;
  final bool isDescription;
  final bool isCustomButtonVisible;
  final bool isClicked;
  final Widget widget;
  final String value;
  final String groupValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => onTap(value),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: theme.colorScheme.surface,
          boxShadow: const [
            BoxShadow(
              blurRadius: 16,
              offset: Offset(0, 1),
              color: lightGray1,
            )
          ],
          border: Border.all(
            width: 1,
            color: lightGray2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Radio<dynamic>(
                  value: value,
                  groupValue: groupValue,
                  onChanged: onTap,
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                      theme.textTheme.labelLarge?.copyWith(
                        fontSize: 16,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    isDescription
                        ? Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF002933),
                      ),
                    )
                        : const SizedBox.shrink(),
                  ],
                ),
              ],
            ),
            isCustomButtonVisible
                ? CustomStrokedButton(
              verticalPadding: 10,
              horizontalPadding: 18,
              textColor: theme.colorScheme.onSurface,
              label: buttonLabel,
              borderColor:lightGray2,
              onTap: customButtonOnTap,
              borderRadius: 24,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
