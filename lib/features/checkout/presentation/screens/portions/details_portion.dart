import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/custom_image.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import '../../../../../core/presentation/resources/drawables.dart';
import '../../../../../core/presentation/theme/colors/colors.dart';
import '../../../../../core/presentation/widgets/bottom_sheet_function.dart';
import '../../../../../core/presentation/widgets/input_field.dart';
import '../../widgets/reusable_summary_product_row.dart';

class DetailsPortion extends StatefulWidget {
  const DetailsPortion({super.key, required this.nextPage, this.controller});

  final Function() nextPage;
  final TextEditingController? controller;

  @override
  State<DetailsPortion> createState() => _DetailsPortionState();
}

class _DetailsPortionState extends State<DetailsPortion> {
  @override
  void initState() {
    super.initState();
  }

  bool isCommentIconClicked = false;
  bool isSendAGiftClicked = false;
  final TextEditingController _purchasingForController =
      TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _recipientEmailAddress = TextEditingController();
  final TextEditingController _message = TextEditingController();

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
            Text(
              "Order Summary",
              style: theme.textTheme.labelLarge?.copyWith(
                fontSize: 16,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ReusableSummaryProductRow(
              productName: 'PMS',
              productQuantity: 10,
              productSummaryPrice: 8200,
              isSvg: true,
            ),
            const ReusableSummaryProductRow(
              productName: 'PMS',
              productQuantity: 10,
              productSummaryPrice: 8200,
              isSvg: true,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: borderGray,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add,
                        size: 18,
                        color: blueTabBarContainerColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Continue Shopping",
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontSize: 12,
                          color: blueTabBarContainerColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 16,
              ),
              child: Divider(
                thickness: 1,
                color: lightGrayTabBarContainerColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Comments",
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontSize: 16,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                isCommentIconClicked
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            isCommentIconClicked = !isCommentIconClicked;
                          });
                        },
                        child: const SvgImage(
                          asset: downArrow,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            isCommentIconClicked = !isCommentIconClicked;
                          });
                        },
                        child: const SvgImage(asset: sideArrow),
                      ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            isCommentIconClicked
                ? Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 1,
                        color: lightGray,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          readOnly: !isCommentIconClicked,
                          controller: widget.controller,
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontSize: 16,
                            color: theme.colorScheme.onSurface,
                          ),
                          minLines: 1,
                          maxLength: 114,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                "(optional)\nE.g I will be coming with a keg",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF768589),
                            ),
                            counterText: '',
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "114 Character",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF909C9F),
                          ),
                        ),
                      ],
                    ),
                  )
                //TODO: don't forget to change to custom textfield
                : Text(
                    "${widget.controller?.text}",
                    style: theme.textTheme.labelSmall?.copyWith(
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
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                sendGiftBottomSheet();
              },
              child: Container(
                color: transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Send as Gift",
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontSize: 16,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                          color: Color(
                            0xFF49495A,
                          ),
                        ),
                      ],
                    ),
                    if (_purchasingForController.text.isNotEmpty)
                      const SizedBox(
                        height: 16,
                      ),
                    if (_purchasingForController.text.isNotEmpty)
                      Text(
                        "Sending to ${_purchasingForController.text}",
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 16,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              thickness: 1,
              color: lightGrayTabBarContainerColor,
            ),
          ],
        ),
      ),
    );
  }

  sendGiftBottomSheet() {
    final theme = Theme.of(context);
    BottomSheetFunction.showCustomBottomSheet(
      context: context,
      color: theme.colorScheme.surface,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            color: borderLightGray,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sent as Gift",
                  style: theme.textTheme.labelLarge?.copyWith(
                      fontSize: 16, color: theme.colorScheme.onSurface),
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CustomImage(asset: confetti),
                        CustomImage(asset: gift),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Icon(
                        Icons.close,
                        color: blueTabBarContainerColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                InputField2(
                  hint: 'Purchasing For',
                  onChange: (val) {},
                ),
                // CustomTextField(
                //   label: 'Purchasing For',
                //   horizontal: 16,
                //   vertical: 19,
                //   buttonController: _purchasingForController,
                // ),
                const SizedBox(
                  height: 16,
                ),
                InputField2(
                  hint: 'From',
                  onChange: (val) {},
                ),
                // CustomTextField(
                //   label: 'From',
                //   horizontal: 16,
                //   vertical: 19,
                //   buttonController: _fromController,
                // ),
                const SizedBox(
                  height: 16,
                ),
                InputField2(
                  hint: 'Recipient Email address',
                  onChange: (val) {},
                ),
                // CustomTextField(
                //   label: 'Recipient Email address',
                //   horizontal: 16,
                //   vertical: 19,
                //   buttonController: _recipientEmailAddress,
                // ),
                const SizedBox(
                  height: 16,
                ),
                InputField2(
                  hint: 'Message (Optional)',
                  onChange: (val) {},
                ),
                // CustomTextField(
                //   label: 'Message (Optional)',
                //   horizontal: 16,
                //   vertical: 19,
                //   buttonController: _message,
                // ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(label: "Confirm Details", onTap: () {
                        Navigator.pop(context);
                        setState(() {});
                      },),
                    )
                    // Expanded(
                    //   child: ElevatedButton(
                    //     style: ButtonStyle(
                    //       shadowColor: WidgetStateProperty.all(gray),
                    //       shape: WidgetStateProperty.all(
                    //         RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(
                    //             24,
                    //           ),
                    //         ),
                    //       ),
                    //       elevation: WidgetStateProperty.all(0),
                    //       backgroundColor: WidgetStateProperty.all(
                    //         blueTabBarContainerColor,
                    //       ),
                    //       padding: WidgetStateProperty.all(
                    //         const EdgeInsets.symmetric(
                    //           vertical: 18,
                    //           horizontal: 40,
                    //         ),
                    //       ),
                    //     ),
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //       setState(() {});
                    //     },
                    //     child: Text(
                    //       "Confirm Details",
                    //       style: theme.textTheme.labelLarge?.copyWith(
                    //         fontSize: 16,
                    //         color: theme.colorScheme.surface,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
