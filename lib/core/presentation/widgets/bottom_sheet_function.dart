import 'package:flutter/material.dart';

import 'bottom_sheet_component.dart';

class BottomSheetFunction {
  static void showCustomBottomSheet({
    required BuildContext context,
    required Widget child,
    required Color color,
    bool? bottomPadding,
    bool? topPadding,
    bool? dismissible = true,
  }) {
    final theme = Theme.of(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: theme.colorScheme.surface,
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isDismissible: dismissible!,
      enableDrag: dismissible,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            24,
          ),
          topRight: Radius.circular(
            24,
          ),
        ),
      ),
      builder: (context) {
        return BottomSheetContainerComponent(
          topPadding: topPadding,
          bottomPadding: bottomPadding,
          child: child,
        );
      },
    );
  }
}