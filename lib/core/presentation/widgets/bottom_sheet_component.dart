import 'package:flutter/material.dart';


class BottomSheetContainerComponent extends StatelessWidget {
  const BottomSheetContainerComponent({
    super.key,
    this.bottomPadding,
    required this.child,
    this.topPadding = true,
  });

  final Widget child;
  final bool? bottomPadding;
  final bool? topPadding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          color: theme.colorScheme.surface,
          child: Column(
            children: [
              Expanded(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
