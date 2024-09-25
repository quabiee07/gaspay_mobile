import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/widgets/reusable_back_button_with_title.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import '../../../../core/presentation/theme/colors/colors.dart';
import '../../../../core/presentation/widgets/bottom_sheet_function.dart';
import '../../../../core/presentation/widgets/button.dart';
import '../../../../core/presentation/widgets/custom_image.dart';
import '../../../../core/presentation/widgets/input_field.dart';
import '../widgets/reusable_beneficiaries_container.dart';

class BeneficiariesScreen extends StatefulWidget {
  const BeneficiariesScreen({super.key});

  @override
  State<BeneficiariesScreen> createState() => _BeneficiariesScreenState();
}

class _BeneficiariesScreenState extends State<BeneficiariesScreen> {
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  isSearch
                      ? Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            boxShadow: [
                              BoxShadow(
                                color: colorBlack.withOpacity(0.04),
                                blurRadius: 15,
                                offset: const Offset(0, 20),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search beneficiary',
                              hintStyle: theme.textTheme.labelSmall?.copyWith(
                                fontSize: 14,
                                color: textExtraLightGray,
                              ),
                              prefixIcon: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgImage(
                                    asset: smallSearchIcon,
                                  ),
                                ],
                              ),
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSearch = false;
                                      });
                                    },
                                    child: Text(
                                      'Cancel',
                                      style:
                                          theme.textTheme.labelSmall?.copyWith(
                                        fontSize: 14,
                                        color: theme.colorScheme.onSurface,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ).animate().scale(duration: 500.ms)
                      : Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: Column(
                            children: [
                              ReusableBackButtonWithTitle(
                                isText: false,
                                title: "",
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                isBackIconVisible: true,
                              ),
                              const Gap(20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Beneficiaries",
                                    style: theme.textTheme.labelLarge!.copyWith(
                                      fontSize: 16,
                                      color: theme.colorScheme.onSurface,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSearch = true;
                                      });
                                    },
                                    child: const SvgImage(
                                      asset: searchIcon,
                                    ),
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
                            ],
                          ),
                        ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const ReusableBeneficiariesContainer();
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Button(
                title: 'Add Beneficiary',
                onPressed: () {
                  beneficiaryBottomSheet();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  beneficiaryBottomSheet() {
    final theme = Theme.of(context);
    BottomSheetFunction.showCustomBottomSheet(
      context: context,
      color: theme.colorScheme.surface,
      child: Column(
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
                    const  SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: (){
                          Navigator.pop(context);
                      },
                      child:const Icon(
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
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
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        label: "Confirm Details",
                        onTap: () {
                          Navigator.pop(context);
                          addBeneficiaryPopUp(context);
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

  void addBeneficiaryPopUp(BuildContext context) {
    final theme = Theme.of(context);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            12,
          )),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomImage(asset: successIcon),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Beneficiary Added Successfully",
                  style: theme.textTheme.labelLarge!.copyWith(
                    fontSize: 16,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1,
                  color: lightGrayTabBarContainerColor,
                ),
                Text(
                  "You have successfully added a new\nbeneficiary",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontSize: 14,
                    color: mediumGray2,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Button(
                    title: "Alright",
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
