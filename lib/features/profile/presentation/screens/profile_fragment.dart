import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/reusable_back_button_with_title.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:gaspay_mobile/features/profile/presentation/manager/profile_provider.dart';
import 'package:gaspay_mobile/features/profile/presentation/screens/acount_details.dart';
import 'package:gaspay_mobile/features/profile/presentation/screens/notification.dart';
import 'package:gaspay_mobile/features/profile/presentation/screens/payment_method.dart';
import 'package:gaspay_mobile/features/profile/presentation/screens/promo_code.dart';
import 'package:gaspay_mobile/features/profile/presentation/screens/wallet.dart';
import 'package:gaspay_mobile/features/profile/presentation/widgets/border_container.dart';
import 'package:gaspay_mobile/features/profile/presentation/widgets/setting_item.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({super.key});

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      provider: ProfileProvider(),
      children: (provider, theme) {
        return [
          const ReusableBackButtonWithTitle(
            isText: true,
            title: 'Profile',
            isBackIconVisible: false,
          ),
          const Gap(20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account Settings',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 15,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const Gap(12),
                  BorderContainer(
                    children: [
                      SettingItem(
                        icon: icProfile,
                        title: 'Account Details',
                        onPressed: () {
                          context.push(const AccountDetailsScreen());
                        },
                      ),
                      const Divider(color: Color(0xFFF0F0F0)),
                      SettingItem(
                        icon: icPromo,
                        title: 'Promo Codes',
                        onPressed: () {
                          context.push(const PromoCodeScreen());
                        },
                      ),
                      const Divider(color: Color(0xFFF0F0F0)),
                      SettingItem(
                        icon: icNotification,
                        title: 'Notifications',
                        onPressed: () {
                          context.push(const NotificationSettingScreen());
                        },
                      ),
                      const Divider(color: Color(0xFFF0F0F0)),
                      SettingItem(
                        icon: icPayment,
                        title: 'Payment Methods',
                        onPressed: () {
                          context.push(const PaymentMethodScreen());

                        },
                      ),
                      const Divider(color: Color(0xFFF0F0F0)),
                      SettingItem(
                        icon: icWallet,
                        title: 'Wallet',
                        onPressed: () {
                          context.push(const WalletScreen());

                        },
                      ),
                    ],
                  ),
                  const Gap(24),
                  Text(
                    'More',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 15,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const Gap(12),
                  BorderContainer(
                    children: [
                      SettingItem(
                        icon: icSupport,
                        title: 'Contact Support',
                        onPressed: () {},
                      ),
                      const Divider(color: Color(0xFFF0F0F0)),
                      SettingItem(
                        icon: icRating,
                        title: 'Rate the App',
                        onPressed: () {},
                      ),
                      const Divider(color: Color(0xFFF0F0F0)),
                      SettingItem(
                        icon: icPolicy,
                        title: 'Privacy Policy',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const Gap(24),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: theme.dividerColor),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 16,
                          offset: const Offset(0, 1),
                          color: const Color(0xFFEFEFEF).withOpacity(.64),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        const SvgImage(asset: icLogout, height: 20, width: 20),
                        const Gap(14),
                        Text(
                          'Logout',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontSize: 14,
                            color: theme.colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(24),
                ],
              ),
            ),
          )
        ];
      },
    );
  }
}
