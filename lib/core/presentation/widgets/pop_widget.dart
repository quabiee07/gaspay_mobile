import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/clickable.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';

class PopWidget extends StatelessWidget {
  const PopWidget({super.key, this.callback});

  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Clickable(
        onPressed: callback == null
            ? () {
                context.pop();
              }
            : callback!,
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              const SvgImage(
                asset: icArrow,
                color: Color(0xFF49495A),
              ),
              const Gap(3),
              Text(
                'Back',
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: 15,
                  color: theme.colorScheme.onSurface ,
                ),
              )
            ],
          ),
        ));
  }
}
