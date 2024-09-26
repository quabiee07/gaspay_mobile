import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/clickable.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/reusable_back_button_with_title.dart';
import 'package:gaspay_mobile/features/profile/presentation/manager/profile_provider.dart';
import 'package:gaspay_mobile/features/profile/presentation/screens/verify_phone.dart';
import 'package:gaspay_mobile/features/profile/presentation/widgets/border_container.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      padding: 16,
      provider: ProfileProvider(),
      children: (provider, theme) {
        return [
          const ReusableBackButtonWithTitle(
            isText: true,
            title: 'Account Details',
            isBackIconVisible: true,
          ),
          const Gap(32),
          Text(
            'Profile Information',
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 15,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const Gap(12),
          BorderContainer(
            children: [
              Text(
                'First Name',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 15,
                  color: theme.colorScheme.onSurface.withOpacity(.7),
                ),
              ),
              const Gap(8),
              Text(
                'Ebuka',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 15,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const AppDivider(),
              Text(
                'Last Name',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 15,
                  color: theme.colorScheme.onSurface.withOpacity(.7),
                ),
              ),
              const Gap(8),
              Text(
                'Ihekwaba',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 15,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const AppDivider(),
              Text(
                'Sex',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 15,
                  color: theme.colorScheme.onSurface.withOpacity(.7),
                ),
              ),
              const Gap(8),
              Text(
                'Male',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 15,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const AppDivider(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone Number',
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontSize: 15,
                          color: theme.colorScheme.onSurface.withOpacity(.7),
                        ),
                      ),
                      const Gap(8),
                      Text(
                        '+23408118249908',
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontSize: 15,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Clickable(
                    onPressed: () {
                      context.push(const VerifyPhoneScreen());
                    },
                    child: Text(
                      'Edit',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 15,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const AppDivider(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontSize: 15,
                          color: theme.colorScheme.onSurface.withOpacity(.7),
                        ),
                      ),
                      const Gap(8),
                      Text(
                        '**********',
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontSize: 15,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    'Edit',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 15,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              )
            ],
          )
        ];
      },
    );
  }
}
