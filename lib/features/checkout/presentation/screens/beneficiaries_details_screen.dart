import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/reusable_back_button_with_title.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';

import '../../../../core/presentation/resources/drawables.dart';
import '../../../../core/presentation/theme/colors/colors.dart';
import '../../../../core/presentation/widgets/bottom_sheet_function.dart';
import '../../../../core/presentation/widgets/custom_image.dart';
import '../../../../core/presentation/widgets/input_field.dart';
import '../widgets/reusable_beneficiary_detail_column.dart';

class BeneficiariesDetailsScreen extends StatefulWidget {
  const BeneficiariesDetailsScreen({super.key});

  @override
  State<BeneficiariesDetailsScreen> createState() =>
      _BeneficiariesDetailsScreenState();
}

class _BeneficiariesDetailsScreenState
    extends State<BeneficiariesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ReusableBackButtonWithTitle(
                  isText: true,
                  title: "Beneficiary",
                  onTap: () {
                    Navigator.pop(context);
                  },
                  isBackIconVisible: true),
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
              CircleAvatar(
                radius: 30,
                backgroundColor: beneficiariesCircleAvatarColour,
                child: Text(
                  "IZ",
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontSize: 16,
                    color: theme.colorScheme.surface,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Inosuke Zenitsu",
                style: theme.textTheme.labelMedium!.copyWith(
                  fontSize: 14,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: Button(
                      height: 48,
                      title: "Delete",
                      isIcon: true,
                      onPressed: () {
                        deleteBeneficiaryPopUp(context);
                      },
                      verticalPadding: 12,
                      icon: Icon(
                        Icons.delete_outline,
                        color: theme.colorScheme.surface,
                      ),
                      buttonColor: redButtonColor,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Button(
                      height: 48,
                      title: "Edit",
                      onPressed: () {
                        vehicleDetailsBottomSheet();
                      },
                      verticalPadding: 12,
                      isIcon: true,
                      icon: Icon(
                        Icons.mode_edit_outline_outlined,
                        color: theme.colorScheme.surface,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              const Divider(
                thickness: 1,
                color: lightGrayTabBarContainerColor,
              ),
              const ReusableBeneficiaryDetailColumn(
                title: 'Car License Plate',
                label: 'LSR_234JK',
              ),
              const ReusableBeneficiaryDetailColumn(
                title: 'Vehicle Brand',
                label: 'Toyota Supra',
              ),
              const ReusableBeneficiaryDetailColumn(
                title: 'Vehicle Colour',
                label: 'Black',
              ),
            ],
          ),
        ),
      ),
    );
  }

  vehicleDetailsBottomSheet() {
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
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Column(
                        children: [
                          CustomImage(asset: blueCar),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.close,
                      color: blueTabBarContainerColor,
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
                  height: 24,
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Button(
                        title: "Confirm Details",
                        onPressed: () {
                          Navigator.pop(context);
                          editBeneficiaryPopUp(context);
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void editBeneficiaryPopUp(BuildContext context) {
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
                  "Beneficiary details edited",
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
                  "You have successfully edited the details\nof this beneficiary",
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
                    height: 48,
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

  void confirmDeletedBeneficiaryPopUp(BuildContext context) {
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
                  "Beneficiary deleted",
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
                  "You have successfully edited deleted Inosuke\nZenitsu as a beneficiary",
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
                    height: 48,
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

  void deleteBeneficiaryPopUp(BuildContext context) {
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
                const SvgImage(asset: questionIcon),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Delete Beneficiary?",
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
                  "Are you sure you want to delete Inosuke\nZenitsu as a beneficiary",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontSize: 14,
                    color: mediumGray2,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: BorderButton(
                          buttonBorderColor: blueTabBarContainerColor,
                          title: "No",
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Button(
                          height: 48,
                          buttonColor: redButtonColor,
                          title: "Alright",
                          onPressed: () {
                            Navigator.of(context).pop();
                            confirmDeletedBeneficiaryPopUp(context);
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
