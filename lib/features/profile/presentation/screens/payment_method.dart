import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/widgets/clickable.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/reusable_back_button_with_title.dart';
import 'package:gaspay_mobile/features/profile/presentation/manager/profile_provider.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      padding: 16,
      provider: ProfileProvider(),
      children: (provider, theme) {
        return [
          const ReusableBackButtonWithTitle(
            isText: false,
            title: 'Promo Codes',
            isBackIconVisible: true,
          ),
          const Gap(32),
          Text(
            'Payment Methods',
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 15,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const Gap(4),
          Text(
            'Manage all your methods of payment in one place',
            style: theme.textTheme.titleSmall?.copyWith(
              fontSize: 13,
              color: theme.colorScheme.onSurface.withOpacity(.8),
            ),
          ),
          const Gap(24),
          Column(
            children: [
              PaymentMethodCard(
                title: 'Wallet',
                subtitle: 'Balance: NGN 250,000.00',
                buttonText: 'Top Up',
                visible: true,
                onTap: () {},
              ),
              const Gap(8),
              PaymentMethodCard(
                title: 'Credit or Debit Card',
                subtitle: 'Visa, Mastercard and more',
                buttonText: 'Add',
                visible: true,
                onTap: () {},
              ),
              const Gap(8),
              PaymentMethodCard(
                title: 'Loans',
                subtitle: 'Balance: NGN 300,000.00',
                buttonText: 'Use',
                visible: true,
                onTap: () {},
              ),
              const Gap(8),
              PaymentMethodCard(
                title: 'Pay Online',
                subtitle: 'Paystack',
                buttonText: '',
                visible: false,
                onTap: () {},
              ),
            ],
          ),
          const Gap(40),
        ];
      },
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.visible,
    required this.onTap,
  });
  final String title;
  final String subtitle;
  final String buttonText;
  final bool visible;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 15,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const Gap(4),
              Text(
                subtitle,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 11,
                  color: theme.colorScheme.onSurface.withOpacity(.6),
                ),
              ),
            ],
          ),
          Visibility(
            visible: visible,
            child: Clickable(
              onPressed: () {
                onTap();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: theme.dividerColor),
                ),
                child: Text(
                  buttonText,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 15,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
