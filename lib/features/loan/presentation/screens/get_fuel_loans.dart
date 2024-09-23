import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/dialogs.dart';
import 'package:gaspay_mobile/core/presentation/widgets/input_field.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/reusable_back_button_with_title.dart';
import 'package:gaspay_mobile/features/loan/presentation/manager/loan_provider.dart';
import 'package:gaspay_mobile/features/loan/presentation/screens/valid_id.dart';
import 'package:gaspay_mobile/features/loan/presentation/widgets/connect_card_modal.dart';
import 'package:gaspay_mobile/features/loan/presentation/widgets/loan_verification_card.dart';

class GetFuelLoansScreen extends StatefulWidget {
  const GetFuelLoansScreen({super.key});

  @override
  State<GetFuelLoansScreen> createState() => _GetFuelLoansScreenState();
}

class _GetFuelLoansScreenState extends State<GetFuelLoansScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      padding: 16,
      provider: LoanProvider(),
      children: (provider, theme) {
        return [
          const ReusableBackButtonWithTitle(
            isText: true,
            title: "Get Fuel Loans",
            isBackIconVisible: true,
          ),
          const Gap(20),
          Text(
            'Complete this process to start using your fuel loan.',
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 14,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const Gap(20),
          LoanVerificationCard(
            number: 1,
            title: 'Connect Credit or Debit Card',
            description: 'Link the card connected to your bank account',
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                barrierColor: Colors.grey[900]!.withOpacity(.8),
                backgroundColor: theme.colorScheme.surface,
                isDismissible: false,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                builder: (context) {
                  return const ConnectCardModal();
                },
              );
            },
          ),
          const Gap(16),
          LoanVerificationCard(
            number: 2,
            title: 'Valid ID',
            description:
                'Provide us with a valid ID to help verify your identity.',
            onTap: () {
              context.push(const ValidIdScreen());
            },
          ),
          const Gap(16),
          LoanVerificationCard(
            number: 3,
            title: 'Utility Bill',
            description:
                'Provide a utility bill less than 3 months old to help us\nverify your address. ',
            onTap: () {
              showDialog(
                context: context,
                barrierColor: Colors.grey[900]!.withOpacity(.8),
                builder: (context) {
                  return Dialog(
                    insetPadding: const EdgeInsets.all(10),
                    alignment: Alignment.bottomCenter,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: IntrinsicHeight(
                        child: Container(
                          // height: 530,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 24),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      icon: const Icon(Icons.close),
                                    )
                                  ],
                                ),
                                const Gap(28),
                                Text(
                                  'Utility Bill',
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontSize: 15,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),
                                const Gap(4),
                                Text(
                                  'Upload a very clear copy of your utility bill. This bill should not be more than 3 months old.',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontSize: 14,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),
                                const Gap(20),
                                InputField2(
                                  hint: 'Image of Utility Bill',
                                  suffix: Text(
                                    'Click to add',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontSize: 14,
                                      color: const Color(0xFFE97437),
                                    ),
                                  ),
                                  onChange: (value) {},
                                ),
                                const Gap(40),
                                Button(
                                  title: 'Submit ID',
                                  onPressed: () {
                                    context.pop();
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (ctx) => SucessDialog(
                                        isCheck: true,
                                        title:
                                            'Utility Bill Submitted Successfully',
                                        subtitle:
                                            'You have successfully submitted your a copy of your utility bills, please wait while we verify it.',
                                        buttonText: 'Alright!',
                                        onFinish: () {
                                         
                                        },
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ).animate().slideY(begin: 1, end: 0, curve: Curves.bounceIn);
                },
              );
            },
          ),
        ];
      },
    );
  }
}
