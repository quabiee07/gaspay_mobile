import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/dialogs.dart';
import 'package:gaspay_mobile/core/presentation/widgets/input_field.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:gaspay_mobile/features/loan/presentation/widgets/list_tile_with_check.dart';
import 'package:gaspay_mobile/features/loan/presentation/widgets/modal_header.dart';

class ConnectCardModal extends StatefulWidget {
  const ConnectCardModal({
    super.key,
  });

  @override
  State<ConnectCardModal> createState() => _ConnectCardModalState();
}

class _ConnectCardModalState extends State<ConnectCardModal> {
  final title = [''];
  final subtitle = [''];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.95,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModalHeader(title: 'Connect Credit or Debit Card'),
          const Gap(40),
          Expanded(
            child: PageView(
              children: [
                Column(
                  children: [
                    const Center(child: SvgImage(asset: cardPic)),
                    const Gap(35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Please note',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontSize: 15,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          const Gap(4),
                          Text(
                            'Please pay attention to the following.',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 14,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          const Gap(20),
                          const ListTileWithCheck(
                            title:
                                'Why do you need to provide your card details?',
                            description:
                                'We store your payment info with our processing partners so that auto-debits and other payments can easily be done when required with no need to enter or confirm them every time.',
                          ),
                          const Gap(16),
                          const ListTileWithCheck(
                            title: 'What type of card do I need to add?',
                            description:
                                'You can add any of your credit cards or debit cards.',
                          ),
                          const Gap(16),
                          const ListTileWithCheck(
                            title: 'Will I be charged?',
                            description:
                                'You will be debited NGN 50 to verify your card details.',
                          ),
                          const Gap(16),
                          const ListTileWithCheck(
                            title: 'Will my card be debited directly?',
                            description:
                                'Whenever you fail to pay back a loan on the agreed date, your card will be debited directly after 24 hours.',
                          ),
                          const Gap(50),
                          Button(
                            title: 'I consent',
                            onPressed: () {},
                          ),
                          const Gap(20),
                        ],
                      ),
                    ),
                  ],
                ),
                const CreditCardInputForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreditCardInputForm extends StatelessWidget {
  const CreditCardInputForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: theme.colorScheme.secondary, width: 1.2),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 70.6,
                  child: Row(
                    children: [
                      Expanded(
                        child: CardInputField(
                          hint: 'Card Number',
                          onChange: (value) {},
                        ),
                      ),
                      const Icon(Icons.credit_card),
                      const Gap(24),
                    ],
                  ),
                ),
                Divider(color: theme.colorScheme.secondary),
                SizedBox(
                  height: 70.6,
                  child: CardInputField(
                    hint: 'Card Holder Name',
                    onChange: (value) {},
                  ),
                ),
                Divider(color: theme.colorScheme.secondary),
                SizedBox(
                  height: 70.6,
                  child: Row(
                    children: [
                      Expanded(
                        child: CardInputField(
                          hint: 'MM/YY',
                          onChange: (value) {},
                        ),
                      ),
                      VerticalDivider(color: theme.colorScheme.secondary),
                      Expanded(
                        child: CardInputField(
                          hint: 'CVV',
                          onChange: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(90),
          Button(
            title: 'Save',
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (ctx) => SucessDialog(
                  title: 'Bank Card Added Succesfully',
                  subtitle: 'You have successfully added your bank card.',
                  buttonText: 'Exit',
                  isCheck: true,
                  onFinish: () {
                    context.pop();
                    context.pop();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
