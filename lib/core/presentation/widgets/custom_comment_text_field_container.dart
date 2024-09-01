import 'package:flutter/material.dart';

import '../theme/colors/colors.dart';

class CustomCommentTextFieldContainer extends StatelessWidget {
  const CustomCommentTextFieldContainer({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: lightGray,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller,
            minLines: 1,
            maxLength: 114,
            maxLines: 3,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              hintText: "(optional)\nE.g I will be coming with a keg",
              hintStyle: TextStyle(
                fontSize: 14,
                color: textLightGray,
              ),
              counterText: '',
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "114 Character",
            style: theme.textTheme.labelMedium?.copyWith(
              fontSize: 12,
              color: mediumGray1,
            ),
          )
        ],
      ),
    );
  }
}
