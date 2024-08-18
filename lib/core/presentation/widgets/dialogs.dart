import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/custom_image.dart';

class SucessDialog extends StatelessWidget {
  const SucessDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onFinish,
  });
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: theme.colorScheme.surface,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomImage(
                asset: imgMail,
                height: 80,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge?.copyWith(fontSize: 15),
              ),
              const Gap(10),
              Divider(color: theme.colorScheme.secondary),
              const Gap(8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 13, color: theme.colorScheme.onSecondary),
              ),
              const Gap(40),
              Button(
                title: buttonText,
                onPressed: onFinish,
              )
            ],
          ),
        ),
      ),
    );
  }
}
