import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/theme/colors/colors.dart';
import 'package:gaspay_mobile/core/presentation/utils/custom_state.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/clickable.dart';

import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/features/loan/presentation/manager/loan_provider.dart';
import 'package:gaspay_mobile/features/loan/presentation/screens/loan_history.dart';
import 'package:gaspay_mobile/features/loan/presentation/screens/tabs/overview_tab.dart';
import 'package:gaspay_mobile/features/loan/presentation/screens/tabs/score_tab.dart';
import 'package:gaspay_mobile/features/loan/presentation/widgets/fund_wallet_card.dart';
// import 'package:gaspay_mobile/features/loan/presentation/widgets/get_fuel_loan_card.dart';

class LoansDashboardScreen extends StatefulWidget {
  static const String id = '/loan-dashboard';
  const LoansDashboardScreen({super.key});

  @override
  State<LoansDashboardScreen> createState() => _LoansDashboardScreenState();
}

class _LoansDashboardScreenState extends CustomState<LoansDashboardScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void onStart() {
    _tabController = TabController(
      length: title.length,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        selectedIndex = _tabController.index;
      });
    });
    super.onStart();
  }

  @override
  void onDestroy() {
    super.dispose();
    _tabController.dispose();
  }

  final title = ['SCORE', 'OVERVIEW'];
  final loanTitle = [
    'Interest Owed',
    'Loan Balance Limit',
    'Amount Used',
    'Available to Spend',
    'Repayment Amount',
    'Repayment Date',
    'Loan Status',
  ];
  final loanSubtitle = [
    'NGN 1,545.21',
    'NGN 300,000.00',
    'NGN 50,000.00',
    'NGN 250,000.00',
    'NGN 301,545.21',
    '31-09-2024',
    'Default',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      provider: LoanProvider(),
      children: (provider, theme) {
        return [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 400,
                    decoration: BoxDecoration(
                      color: loanBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Gap(25),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TabBar(
                                controller: _tabController,
                                labelStyle: theme.textTheme.bodyMedium
                                    ?.copyWith(fontSize: 11),
                                labelColor: theme.colorScheme.surface,
                                unselectedLabelColor:
                                    theme.colorScheme.onSurface,
                                tabAlignment: TabAlignment.center,
                                dividerColor: Colors.transparent,
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicator: const BoxDecoration(),
                                splashBorderRadius: BorderRadius.circular(8),
                                physics: const NeverScrollableScrollPhysics(),
                                splashFactory: NoSplash.splashFactory,
                                tabs: List.generate(title.length, (index) {
                                  final item = title.elementAt(index);
                                  return Tab(
                                      child: selectedIndex == index
                                          ? Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 18),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color:
                                                    theme.colorScheme.primary,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  item,
                                                  style: theme
                                                      .textTheme.bodyLarge
                                                      ?.copyWith(
                                                    color: theme
                                                        .colorScheme.surface,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Text(item,
                                              style:
                                                  theme.textTheme.bodyLarge));
                                }),
                              ),
                              const Gap(8),
                              Expanded(
                                child: TabBarView(
                                  physics: const BouncingScrollPhysics(),
                                  controller: _tabController,
                                  children: const [
                                    ScoreTab(),
                                    OverviewTab(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(24),
                  // const GetFuelLoansCard()
                  Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 8, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Loan Summary',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontSize: 15,
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                            const Icon(Icons.refresh_rounded)
                          ],
                        ),
                      ),
                      Divider(color: theme.colorScheme.secondary),
                      const Gap(16),
                      Column(
                        children: List.generate(loanTitle.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 12, left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  loanTitle[index],
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontSize: 14,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),
                                Text(
                                  loanSubtitle[index],
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontSize: 15,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      const Gap(32),
                      Clickable(
                        onPressed: () {
                          context.push(const LoanHistory());
                        },
                        child: const FundWalletCard(),
                      ),
                    ],
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ),
        ];
      },
    );
  }
}
