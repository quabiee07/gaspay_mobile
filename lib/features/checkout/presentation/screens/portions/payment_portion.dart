import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gaspay_mobile/core/presentation/widgets/input_field.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';

import '../../../../../core/presentation/resources/drawables.dart';
import '../../../../../core/presentation/theme/colors/colors.dart';
import '../../widgets/custom_stroked_button.dart';
import '../../widgets/reusable_payment_method_container.dart';
import '../../widgets/reusable_summary_product_row.dart';

class PaymentPortion extends StatefulWidget {
  const PaymentPortion({
    super.key,
    required this.nextPage,
    required this.commentControllerText,
  });

  final Function() nextPage;
  final String commentControllerText;

  @override
  State<PaymentPortion> createState() => _PaymentPortionState();
}

class _PaymentPortionState extends State<PaymentPortion> {
  bool isPaymentMethodeClicked = false;

  @override
  void initState() {
    super.initState();
  }

  String groupValue = "";
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SvgImage(asset: locationIcon,),
                        const SizedBox(
                          width: 16,
                        ),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Filling Station",
                              style:
                                 theme.textTheme.labelLarge?.copyWith(
                                   fontSize: 16,
                                   color: theme.colorScheme.onSurface,
                                 ),
                            ),
                           const  SizedBox(
                              height: 2,
                            ),
                             Text(
                              "Smith Roundabout",
                              style:
                                  theme.textTheme.labelMedium?.copyWith(
                                    fontSize: 14,
                                    color: mediumGray2,
                                  ),
                            )
                          ],
                        )
                      ],
                    ),
                    const Padding(
                      padding:  EdgeInsets.only(top: 4),
                      child: SvgImage(asset: sideArrow,),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  thickness: 1,
                  color: lightGrayTabBarContainerColor,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
            const ReusableSummaryProductRow(
              productName: 'PMS',
              productQuantity: 10,
              productSummaryPrice: 8200,
              isSvg: false,
            ),
            const ReusableSummaryProductRow(
              productName: 'PMS',
              productQuantity: 10,
              productSummaryPrice: 8200,
              isSvg: false,
            ),
             Text(
              "Comment",
              style:
                  theme.textTheme.labelMedium?.copyWith(
                    fontSize: 16,
                    color: theme.colorScheme.onSurface,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              widget.commentControllerText,
              style:  theme.textTheme.labelSmall?.copyWith(
                fontSize: 16,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Divider(
              thickness: 1,
              color: lightGrayTabBarContainerColor,
            ),
            const SizedBox(
              height: 16,
            ),
             Text(
              "Send as Gift",
              style: theme.textTheme.labelMedium?.copyWith(
                fontSize: 16,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              thickness: 1,
              color: lightGrayTabBarContainerColor,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child:
                      InputField2(
            hint: 'Enter Promo Code', onChange: (val ) {  },

            ),
                  // CustomTextField(
                  //   label: "Enter Promo Code",
                  //   horizontal: 16,
                  //   vertical: 14,
                  //   buttonController: _controller,
                  // ),
                ),
                const SizedBox(
                  width: 12,
                ),
                CustomStrokedButton(
                  verticalPadding: 14,
                  horizontalPadding: 22,
                  textColor: blueTabBarContainerColor,
                  label: 'Apply Code',
                  borderColor: blueTabBarContainerColor,
                  onTap: () {},
                  borderRadius: 24,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1,
              color: lightGrayTabBarContainerColor,
            ),
            const SizedBox(
              height: 32,
            ),
             Text(
              "Payment Method",
              style:
              theme.textTheme.labelLarge?.copyWith(
                fontSize: 16,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ReusablePaymentMethodContainer(
              title: 'Wallet',
              buttonLabel: 'Top Up',
              description: 'Balance: NGN 250,000.00',
              customButtonOnTap: () {},
              onTap: (val) {
                setState(() {
                  groupValue = "Wallet";
                });
              },
              isDescription: true,
              isCustomButtonVisible: true,
              isClicked: isPaymentMethodeClicked,
              widget: SvgPicture.asset("assets/images/selectedIcon.svg"),
              value: 'Wallet',
              groupValue: groupValue,
            ),
            ReusablePaymentMethodContainer(
              title: 'Credit or Debit Card',
              buttonLabel: 'Add',
              description: 'Visa, Mastercard and more',
              customButtonOnTap: () {},
              onTap: (value) {
                setState(() {
                  groupValue = "Card";
                });
              },
              isDescription: true,
              isCustomButtonVisible: true,
              isClicked: isPaymentMethodeClicked,
              widget:const  SvgImage(asset: selectedIcon),
              value: 'Card',
              groupValue: groupValue,
            ),
            ReusablePaymentMethodContainer(
              title: 'Loans',
              buttonLabel: 'Use',
              description: 'Balance: NGN 0.00',
              customButtonOnTap: () {},
              onTap: (value) {
                setState(() {});
                groupValue = "Loans";
              },
              isDescription: true,
              isCustomButtonVisible: true,
              isClicked: isPaymentMethodeClicked,
              widget: const  SvgImage(asset: selectedIcon),
              value: 'Loans',
              groupValue: groupValue,
            ),
            ReusablePaymentMethodContainer(
              title: 'Pay Online',
              buttonLabel: 'Paystack',
              description: 'Paystack',
              customButtonOnTap: () {},
              onTap: (value) {
                setState(() {
                  groupValue = "Pay Online";
                });
              },
              isDescription: true,
              isCustomButtonVisible: false,
              isClicked: isPaymentMethodeClicked,
              widget: const  SvgImage(asset: selectedIcon),
              value: 'Pay Online',
              groupValue: groupValue,
            ),
          ],
        ),
      ),
    );
  }
}