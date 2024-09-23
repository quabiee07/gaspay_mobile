import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/reusable_back_button_with_title.dart';
import 'package:gaspay_mobile/features/loan/presentation/manager/loan_provider.dart';
import 'package:gaspay_mobile/features/loan/presentation/widgets/fund_wallet_card.dart';

class LoanHistoryDetails extends StatefulWidget {
  const LoanHistoryDetails({super.key});

  @override
  State<LoanHistoryDetails> createState() => _LoanHistoryDetailsState();
}

class _LoanHistoryDetailsState extends State<LoanHistoryDetails> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      padding: 0,
      provider: LoanProvider(),
      children: (provider, theme) {
        return [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: ReusableBackButtonWithTitle(
              isText: false,
              title: "",
              isBackIconVisible: true,
            ),
          ),
          const Gap(24),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            decoration: const BoxDecoration(
              color: Color(0xFFEBF9EE),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                const Gap(4),
                Text(
                  'This loan has been paid in full.',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 14,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          const Gap(24),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    stackedText(
                      context: context,
                      title: 'Amount Used',
                      amount: 'NGN 300,000.00',
                    ),
                    stackedText(
                      context: context,
                      title: 'Repayment Amount',
                      amount: 'NGN 301,545.21',
                    ),
                  ],
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    stackedText(
                      context: context,
                      title: 'Date of Loan',
                      amount: '31-08-2024',
                    ),
                    stackedText(
                      context: context,
                      title: 'Repayment Date',
                      amount: '31-09-2024',
                    ),
                  ],
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    stackedText(
                      context: context,
                      title: 'Interest',
                      amount: '0.3%',
                    ),
                    Container(
                      width: 120,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Text(
                          'Paid',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontSize: 15,
                            color: theme.colorScheme.surface,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Gap(50),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFF7F7F7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Late payment fee (Interest accrues daily):',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontSize: 11,
                    color: const Color(0xFF909090),
                  ),
                ),
                const Gap(12),
                Text(
                  'NGN 150.00',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 14,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFFFEBF0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                const Gap(8),
                Expanded(
                  child: Text(
                    'Your late fee increases by 0.4% of the amount you are yet to pay every day you don’t pay up',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 14,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          const Padding(
            padding: EdgeInsets.all(16),
            child: FundWalletCard(),
          ),
        ];
      },
    );
  }
}

stackedText({
  required BuildContext context,
  required String title,
  required String amount,
}) {
  final theme = Theme.of(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: theme.textTheme.titleSmall?.copyWith(
          fontSize: 14,
          color: theme.colorScheme.onSurface,
        ),
      ),
      const Gap(8),
      Text(
        amount,
        style: theme.textTheme.titleLarge?.copyWith(
          fontSize: 15,
          color: theme.colorScheme.onSurface,
        ),
      ),
    ],
  );
}
