import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/manager/comment_provider.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/custom_comment_text_field_container.dart';
import 'package:gaspay_mobile/core/presentation/widgets/custom_image.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:gaspay_mobile/features/checkout/presentation/screens/beneficiaries_screen.dart';
import 'package:provider/provider.dart';
import '../../../../../core/presentation/resources/drawables.dart';
import '../../../../../core/presentation/theme/colors/colors.dart';
import '../../../../../core/presentation/widgets/bottom_sheet_function.dart';
import '../../../../../core/presentation/widgets/input_field.dart';
import '../../widgets/reusable_beneficiaries_column.dart';
import '../../widgets/reusable_summary_product_row.dart';

class DetailsPortion extends StatefulWidget {
  const DetailsPortion(
      {super.key, required this.nextPage, });

  final Function() nextPage;

  @override
  State<DetailsPortion> createState() => _DetailsPortionState();
}

class _DetailsPortionState extends State<DetailsPortion> {
  bool isCommentIconClicked = false;
  bool isSendAGiftClicked = false;
  final TextEditingController _purchasingForController =
      TextEditingController();
  late FocusNode _focusNode;
  late TextEditingController commentController;
  @override
  void initState() {
    _focusNode = FocusNode();
    final commentProvider = Provider.of<CommentsProvider>(context, listen: false);
    commentController = TextEditingController(text: commentProvider.checkoutComment);
    super.initState();
  }
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final commentProvider = Provider.of<CommentsProvider>(context);

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
                ? CustomCommentTextFieldContainer(
                    commentController:commentController,
                    onChange: (newComment) {
                      commentProvider.updateCheckoutComment(newComment);
                    }, focusNode:  _focusNode,
                  )
                : Text(
              commentProvider.checkoutComment,
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
                vehicleDetailsBottomSheet();
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
                          "Vehicle Details",
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
                const SizedBox(
                  height: 16,
                ),
                InputField2(
                  hint: 'From',
                  onChange: (val) {},
                ),
                const SizedBox(
                  height: 16,
                ),
                InputField2(
                  hint: 'Recipient Email address',
                  onChange: (val) {},
                ),
                const SizedBox(
                  height: 16,
                ),
                InputField2(
                  hint: 'Message (Optional)',
                  onChange: (val) {},
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        label: "Confirm Details",
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  vehicleDetailsBottomSheet() {
    final theme = Theme.of(context);
    BottomSheetFunction.showCustomBottomSheet(
        context: context,
        color: theme.colorScheme.surface,
        child: StatefulBuilder(builder: (context, setState) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                color: borderLightGray,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Vehicle Details",
                      style: theme.textTheme.labelLarge?.copyWith(
                          fontSize: 16, color: theme.colorScheme.onSurface),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Column(
                            children: [
                              CustomImage(asset: blueCar),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Beneficiaries",
                          style: theme.textTheme.labelLarge!.copyWith(
                              fontSize: 14, color: theme.colorScheme.onSurface),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BeneficiariesScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "View all",
                            style: theme.textTheme.labelLarge!.copyWith(
                              fontSize: 14,
                              color: blueTabBarContainerColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 80,
                            child: ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return const ReusableBeneficiariesColumn();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputField2(
                      hint: 'Driver Name',
                      onChange: (val) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField2(
                      hint: 'Car License Plate',
                      onChange: (val) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField2(
                      hint: 'Vehicle Brand',
                      onChange: (val) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField2(
                      hint: 'Vehicle Colour',
                      onChange: (val) {},
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SwitchListTile(
                      title: Text(
                        "Save Vehicle Details",
                        style: theme.textTheme.labelLarge!.copyWith(
                            fontSize: 16, color: theme.colorScheme.onSurface),
                      ),
                      activeColor: theme.colorScheme.surface,
                      contentPadding: EdgeInsets.zero,
                      activeTrackColor: blueTabBarContainerColor,
                      inactiveTrackColor: darkGray1.withOpacity(0.17),
                      inactiveThumbColor: theme.colorScheme.surface,
                      trackOutlineColor:
                          WidgetStateProperty.all(theme.colorScheme.surface),
                      thumbIcon: WidgetStateProperty.all(const Icon(null)),
                      value: isSwitch,
                      onChanged: (value) {
                        setState(() {
                          isSwitch = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            label: "Confirm Details",
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {});
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
  }

  bool isSwitch = false;
}
