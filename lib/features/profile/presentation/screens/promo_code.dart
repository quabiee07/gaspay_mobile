import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/reusable_back_button_with_title.dart';
import 'package:gaspay_mobile/features/profile/presentation/manager/profile_provider.dart';

class PromoCodeScreen extends StatelessWidget {
  const PromoCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return ProviderWidget(
      padding: 16,
      provider: ProfileProvider(),
      children: (provider, theme) {
        return [
          const ReusableBackButtonWithTitle(
            isText: true,
            title: 'Promo Codes',
            isBackIconVisible: true,
          ),
          const Gap(20),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  height: 66,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDDEAFF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Center(
                          child: Text(
                            'NGN 1,000',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontSize: 15,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                      const Gap(16),
                      Column(
                        children: List.generate(
                          70 ~/ 10, // Number of dashes
                          (index) => Container(
                            color: index % 2 == 0
                                ? const Color(0xFFFEF3EE)
                                : Colors.transparent,
                            width: 1,
                            height: 5,
                          ),
                        ),
                      ),
                      const Gap(16),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'WEI2-1OP',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontSize: 13,
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                            const Gap(8),
                            Text(
                              'Valid till 08-09-2024',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize: 11,
                                color:
                                    theme.colorScheme.onSurface.withOpacity(.5),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Gap(8),
              itemCount: 7,
            ),
          ),
          const Gap(20),
        ];
      },
    );
  }
}
