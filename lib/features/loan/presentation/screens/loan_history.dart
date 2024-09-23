import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/reusable_back_button_with_title.dart';
import 'package:gaspay_mobile/features/loan/presentation/manager/loan_provider.dart';
import 'package:gaspay_mobile/features/loan/presentation/widgets/loan_history_item.dart';

class LoanHistory extends StatefulWidget {
  const LoanHistory({super.key});

  @override
  State<LoanHistory> createState() => _LoanHistoryState();
}

class _LoanHistoryState extends State<LoanHistory> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      provider: LoanProvider(),
      children: (provider, theme) {
        return [
          const ReusableBackButtonWithTitle(
            isText: true,
            title: "Loan History",
            isBackIconVisible: true,
            suffixWidget: Icon(Icons.calendar_month_rounded),
          ),
          const Gap(24),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return LoanHistoryItem(index: index);
              },
              separatorBuilder: (context, index) => const Gap(16),
              itemCount: 4,
            ),
          )
        ];
      },
    );
  }
}
