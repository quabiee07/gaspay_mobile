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
    this.isCheck = false,
  });
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onFinish;
  final bool isCheck;

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
              CustomImage(
                asset: isCheck ? checkMark : imgMail,
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
              Container(
                height: 40,
                padding: const EdgeInsets.only(
                    left: 16, top: 4, bottom: 4, right: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFF60ADFA)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'We usually take',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 13,
                        color: theme.colorScheme.onSecondary.withOpacity(.5),
                      ),
                    ),
                    Container(
                      width: 148,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFDDCE).withOpacity(.5),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 16,
                          ),
                          const Gap(9),
                          Text(
                            '10 mins - 1 hour',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontSize: 13,
                              color: theme.colorScheme.onSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
