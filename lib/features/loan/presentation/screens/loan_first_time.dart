import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/theme/colors/colors.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/reusable_back_button_with_title.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:gaspay_mobile/features/loan/presentation/manager/loan_provider.dart';
import 'package:provider/provider.dart';

class LoanFirstTimeScreen extends StatefulWidget {
  const LoanFirstTimeScreen({super.key,});


  @override
  State<LoanFirstTimeScreen> createState() => _LoanFirstTimeScreenState();
}

class _LoanFirstTimeScreenState extends State<LoanFirstTimeScreen> {
  LoanProvider? _provider;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<LoanProvider>(builder: (_, provider, __) {
      _provider ??= provider;
      return Scaffold(
        backgroundColor: theme.colorScheme.surface,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.maxFinite,
                height: 381,
                color: loanBg,
              ),
              Positioned(
                right: 0,
                left: 0,
                top: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const ReusableBackButtonWithTitle(
                        isText: true,
                        title: 'Loans',
                        isBackIconVisible: false,
                      ),
                      const Gap(20),
                      Container(
                        width: double.maxFinite,
                        height: 373,
                        decoration: BoxDecoration(
                          color: loanFg,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Gap(18),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Check if you are eligible\n for a fuel loan',
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontSize: 20,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),
                                const Gap(8),
                                Text(
                                  'Never stop, even when your wallet does',
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontSize: 14,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                            const SvgImage(asset: loanPic)
                          ],
                        ),
                      ),
                      const Gap(63),
                      Button(
                        title: 'Check Your Patronage Score',
                        onPressed: () {
                          provider.toggleIsFirst();
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
