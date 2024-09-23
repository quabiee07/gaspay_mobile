import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/utils/custom_state.dart';
import 'package:gaspay_mobile/features/loan/presentation/manager/loan_provider.dart';
import 'package:gaspay_mobile/features/loan/presentation/screens/loan_dashboard.dart';
import 'package:gaspay_mobile/features/loan/presentation/screens/loan_first_time.dart';
import 'package:provider/provider.dart';

class LoansFragment extends StatefulWidget {
  const LoansFragment({super.key});

  @override
  State<LoansFragment> createState() => _LoansFragmentState();
}

class _LoansFragmentState extends CustomState<LoansFragment> {
  LoanProvider? _provider;

  @override
  void onStarted() {
    _provider?.checkLoanStatus();
    super.onStarted();
  }

  void completeOnboarding() {
    _provider!.setLoanOnboarding();
    setState(() {
      _provider?.state.isFirstTime = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoanProvider(),
      child: Consumer<LoanProvider>(
        builder: (_, provider, __) {
          _provider ??= provider;
          final state = provider.state;
          log('${state.isFirstTime}');
          return provider.isFirst()
              ? const LoanFirstTimeScreen(
                  key: ValueKey('onboarding'),
                )
              : const LoansDashboardScreen(
                  key: ValueKey('dashboard'),
                );
        },
      ),
    );
  }
}
