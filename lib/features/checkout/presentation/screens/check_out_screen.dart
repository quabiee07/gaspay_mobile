import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/features/checkout/presentation/screens/checkout_transaction_pin_screen.dart';
import 'package:gaspay_mobile/features/checkout/presentation/screens/portions/details_portion.dart';
import 'package:gaspay_mobile/features/checkout/presentation/screens/portions/payment_portion.dart';

import '../../../../core/presentation/theme/colors/colors.dart';
import '../../../../core/presentation/widgets/reusable_back_button_with_title.dart';
import '../widgets/check_out_indicator_progress_row.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({
    super.key,
    required this.newCart,
    required this.totalAmount,
    this.controller,
  });

  final List newCart;
  final double totalAmount;
  final TextEditingController? controller;

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Widget> screens = getScreens();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: ReusableBackButtonWithTitle(
                isBackIconVisible: true,
                isText: true,
                title: "CheckOut",
                suffixWidget: const Icon(Icons.close),
                onTap: () {
                  setState(() {
                    if (currentPage == 1) {
                      pageController.previousPage(
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CheckOutIndicatorProgressRow(
              currentPage: currentPage,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = pageController.page?.round() ?? 0;
                  });
                },
                children: screens,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 40,
                top: 28,
              ),
              decoration: BoxDecoration(color:theme.colorScheme.surface, boxShadow: [
                BoxShadow(
                  color:  colorBlack.withOpacity(0.25),
                  blurRadius: 18,
                  offset: const Offset(0, 2),
                ),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Order Total(${widget.newCart.length})",
                            style:
                                theme.textTheme.labelMedium?.copyWith(
                                  fontSize: 16,
                                  color: mediumGray2,
                                ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color:blueTabBarContainerColor,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "NGN ${widget.totalAmount}",
                        style:
                        theme.textTheme.labelLarge?.copyWith(
                          fontSize: 18,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    label: "Proceed", onTap: (){
                    nextPage();
                  },),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void nextPage() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    if (currentPage == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const CheckoutTransactionPinScreen(),
        ),
      );
    }
  }

  List<Widget> getScreens() {
    return [
      DetailsPortion(
        nextPage: nextPage,
        controller: widget.controller ?? TextEditingController(),
      ),
      PaymentPortion(
        nextPage: nextPage,
        commentControllerText: widget.controller?.text ?? "",
      ),
    ];
  }
}