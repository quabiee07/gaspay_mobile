import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/widgets/clickable.dart';
import 'package:gaspay_mobile/core/presentation/widgets/custom_image.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/reusable_back_button_with_title.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:gaspay_mobile/features/profile/presentation/manager/profile_provider.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      padding: 16,
      provider: ProfileProvider(),
      children: (provider, theme) {
        return [
          const ReusableBackButtonWithTitle(
            isText: true,
            title: 'Wallet',
            isBackIconVisible: true,
          ),
          const Gap(53),
          const WalletBalanceCard(
            balance: '250,000.00',
          ),
          const Gap(33),
          Text(
            'Top up with',
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 15,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const Gap(16),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio(
                    activeColor: theme.colorScheme.primary,
                    toggleable: true,
                    value: true,
                    groupValue: provider.isCard,
                    onChanged: (value) {
                      provider.setTopUp(value!);
                    }),
                const Gap(8),
                const SvgImage(
                  asset: icVisa,
                  width: 40,
                ),
                const Gap(12),
                Text(
                  '**** **** **** 2524',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 15,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const Gap(16),
                Clickable(
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: theme.dividerColor),
                    ),
                    child: Text(
                      'Change',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 15,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio(
                    activeColor: theme.colorScheme.primary,
                    value: false,
                    groupValue: provider.isCard,
                    onChanged: (value) {
                      provider.setTopUp(value!);
                    }),
                const Gap(8),
                const CustomImage(
                  asset: paystack,
                  width: 103,
                ),
              ],
            ),
          ),
        ];
      },
    );
  }
}

class WalletBalanceCard extends StatelessWidget {
  const WalletBalanceCard({
    super.key,
    required this.balance,
  });
  final String balance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: SizedBox(
        height: 170,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Align(
              alignment: Alignment.center,
              child: SvgImage(asset: icWalletBg),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: CustomImage(asset: money),
            ),
            Positioned(
              left: 30,
              top: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Wallet',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontSize: 13,
                      color: const Color(0xFFB8B8B8),
                    ),
                  ),
                  const Gap(4),
                  Text(
                    'NGN $balance',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 18,
                      color: theme.colorScheme.surface,
                    ),
                  ),
                  const Gap(12),
                  Text(
                    'Your first top-up is free!',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontSize: 13,
                      color: const Color(0xFFB8B8B8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
