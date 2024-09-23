import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/theme/colors/colors.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/clickable.dart';
import 'package:gaspay_mobile/core/presentation/widgets/custom_image.dart';
import 'package:gaspay_mobile/core/presentation/widgets/dialogs.dart';
import 'package:gaspay_mobile/core/presentation/widgets/input_field.dart';
// import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/features/loan/presentation/manager/loan_provider.dart';
import 'package:provider/provider.dart';

class ValidIdScreen extends StatefulWidget {
  const ValidIdScreen({super.key});

  @override
  State<ValidIdScreen> createState() => _ValidIdScreenState();
}

class _ValidIdScreenState extends State<ValidIdScreen> {
  final title = [
    'National Identity Number (NIN)',
    'Valid Voters\nCard',
    'International Passport',
    'Bank Verification Number (BVN)',
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (_) => LoanProvider(),
      child: Consumer<LoanProvider>(
        builder: (_, provider, __) {
          return Scaffold(
            body: Column(
              children: [
                Container(
                  height: 276,
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(color: loanBg),
                  child: Column(
                    children: [
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Clickable(
                            onPressed: () {
                              context.pop();
                            },
                            child: Text(
                              'Cancel',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontSize: 14,
                                color: const Color(0xFFCA3F00),
                              ),
                            ),
                          ),
                          Text(
                            'Valid ID',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 14,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(width: 48),
                        ],
                      ),
                      const Gap(24),
                      const Center(
                        child: CustomImage(
                          asset: idCard,
                          height: 143,
                          width: 174,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select your preferred ID',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: 15,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        'You only need to submit the details of one ID as this is used to verify your identity before you can get access to fuel loans.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 14,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const Gap(20),
                      Wrap(
                        runSpacing: 12,
                        spacing: 13,
                        children: List.generate(4, (index) {
                          return Clickable(
                            onPressed: () {
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
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: IntrinsicHeight(
                                        child: Container(
                                          // height: 530,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 24),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        context.pop();
                                                      },
                                                      icon: const Icon(
                                                          Icons.close),
                                                    )
                                                  ],
                                                ),
                                                const Gap(28),
                                                Text(
                                                  'National Identity Number',
                                                  style: theme
                                                      .textTheme.titleLarge
                                                      ?.copyWith(
                                                    fontSize: 15,
                                                    color: theme
                                                        .colorScheme.onSurface,
                                                  ),
                                                ),
                                                const Gap(4),
                                                Text(
                                                  'Enter your NIN details and image to proceed',
                                                  style: theme
                                                      .textTheme.bodySmall
                                                      ?.copyWith(
                                                    fontSize: 14,
                                                    color: theme
                                                        .colorScheme.onSurface,
                                                  ),
                                                ),
                                                const Gap(20),
                                                InputField2(
                                                  hint: 'NIN',
                                                  onChange: (value) {},
                                                ),
                                                const Gap(16),
                                                InputField2(
                                                  hint: 'Date of Issue',
                                                  suffix: const Icon(
                                                      Icons.date_range_rounded),
                                                  onChange: (value) {},
                                                ),
                                                const Gap(16),
                                                InputField2(
                                                  hint: 'Date of Issue',
                                                  suffix: const Icon(
                                                      Icons.date_range_rounded),
                                                  onChange: (value) {},
                                                ),
                                                const Gap(16),
                                                InputField2(
                                                  hint: 'Front Image of ID',
                                                  suffix: Text(
                                                    'Click to add',
                                                    style: theme
                                                        .textTheme.bodyMedium
                                                        ?.copyWith(
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xFFE97437),
                                                    ),
                                                  ),
                                                  onChange: (value) {},
                                                ),
                                                const Gap(16),
                                                InputField2(
                                                  hint: 'Back Image of ID',
                                                  suffix: Text(
                                                    'Click to add',
                                                    style: theme
                                                        .textTheme.bodyMedium
                                                        ?.copyWith(
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xFFE97437),
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
                                                      builder: (ctx) =>
                                                          SucessDialog(
                                                        isCheck: true,
                                                        title:
                                                            'NIN Submitted Successfully',
                                                        subtitle:
                                                            'You have successfully submitted your NIN details, please wait while we verify it..',
                                                        buttonText: 'Alright!',
                                                        onFinish: () {
                                                          if (mounted) {
                                                            context.pop();
                                                          }
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
                                  ).animate().slideY(
                                      begin: 1, end: 0, curve: Curves.bounceIn);
                                },
                              );
                            },
                            child: Container(
                              width: 168,
                              height: 152,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: const Color(0xFFEBEBF0)),
                                  color: const Color(0xFFF7FBFF)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 42,
                                    width: 42,
                                    decoration: BoxDecoration(
                                      color: [
                                        Colors.blue,
                                        Colors.black,
                                        Colors.orange,
                                        Colors.green,
                                      ][index],
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.credit_card,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Gap(22),
                                  Text(
                                    title[index],
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      fontSize: 15,
                                      color: theme.colorScheme.onSurface,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
