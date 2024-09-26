import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/widgets/clickable.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
// import 'package:the_lex_app/core/presentation/theme/colors/colors.dart';
// import 'package:the_lex_app/core/presentation/widgets/clickable.dart';
// import 'package:the_lex_app/core/presentation/widgets/svg_image.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    this.trailing,
  });

  final String icon;
  final String? trailing;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Clickable(
      onPressed: () {
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 50,
        child: Row(
          children: [
            SvgImage(
              asset: icon,
              color: theme.colorScheme.onSurface,
              height: 20,
              width: 20,
            ),
            const Gap(14),
            Text(
              title,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 14,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Spacer(),
            trailing != null
                ? SvgImage(asset: trailing!)
                : const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: Colors.black,
                  ),
          ],
        ),
      ),
    );
  }
}

