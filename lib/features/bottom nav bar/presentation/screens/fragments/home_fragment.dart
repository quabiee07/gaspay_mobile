import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gaspay_mobile/core/presentation/widgets/custom_image.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:gaspay_mobile/features/notification/presentation/screens/notification_screen.dart';
import '../../../../../core/presentation/resources/drawables.dart';
import '../../../../../core/presentation/theme/colors/colors.dart';
import '../../../../../core/presentation/widgets/bottom_sheet_function.dart';
import '../../../../../core/presentation/widgets/button.dart';
import '../../../../../core/presentation/widgets/input_field.dart';
import '../../../../../core/presentation/widgets/reusable_brand_container.dart';
import '../../../../../core/presentation/widgets/reusable_favourite_container.dart';
import '../../../../add to cart/presentation/widgets/reusable_ratings_container.dart';
import '../../../../buy gas/presentation/screens/buy_gas_screen.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

bool isSearching = false;

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isSearching
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          boxShadow: [
                            BoxShadow(
                              color: colorBlack.withOpacity(0.1),
                              blurRadius: 15,
                              offset: const Offset(0, 20),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Product',
                            hintStyle: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 14,
                              color: textExtraLightGray,
                            ),
                            prefixIcon: const Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 12),
                                  child: SvgImage(
                                    asset: smallSearchIcon,
                                  ),
                                ),
                              ],
                            ),
                            suffixIcon: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSearching = false;
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).animate().scale(duration: 500.ms)
                    : Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: AssetImage(
                                    profilePic,
                                  ),
                                  radius: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Albrighton",
                                      style:
                                          theme.textTheme.labelLarge?.copyWith(
                                        fontSize: 16,
                                        color: theme.colorScheme.onSurface,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          color: transparent,
                                          width: 150,
                                          child: Text(
                                            "D498 oloye cresent,Royal Gradens",
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.labelMedium
                                                ?.copyWith(
                                              fontSize: 10,
                                              color: textLightGray,
                                            ),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_down_sharp,
                                          color: textLightGray,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSearching = true;
                                      });
                                    },
                                    child: const SvgImage(
                                      asset: searchIcon,
                                    )),
                                const SizedBox(
                                  width: 22,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const NotificationScreen(),
                                      ),
                                    );
                                  },
                                  child: const SvgImage(
                                    asset: notificationIcon,
                                  ),
                                ),
                                const SizedBox(
                                  width: 22,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    filterBottomSheet();
                                  },
                                  child: const SvgImage(
                                    asset: filterIcon,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Promotion",
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontSize: 16,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return const Padding(
                                padding: EdgeInsets.only(
                                  left: 20,
                                ),
                                child: CustomImage(
                                  asset: clippedPicture,
                                  fit: BoxFit.cover,
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    "Featured Brands",
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontSize: 16,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableBrandContainer(
                        label: 'Shell',
                        imagePath: shellLogo,
                        color: shellYellow,
                        imagePathOpacity: 0.25,
                      ),
                      ReusableBrandContainer(
                        label: 'Total',
                        imagePath: totalLogo,
                        color: totalPink,
                        imagePathOpacity: 0.21,
                      ),
                      ReusableBrandContainer(
                        label: 'NNPC',
                        imagePath: nnpcLogo,
                        color: nnpcGreen,
                        imagePathOpacity: 0.11,
                        imagePadding: 5.25,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableBrandContainer(
                        label: 'Mobil',
                        imagePath: mobilLogo,
                        color: mobilGray,
                        imagePathOpacity: 0.37,
                      ),
                      ReusableBrandContainer(
                        label: 'Ap',
                        imagePath: apLogo,
                        color: apYellow,
                        imagePathOpacity: 0.26,
                      ),
                      ReusableBrandContainer(
                        label: 'Conoil',
                        imagePath: conoilLogo,
                        color: conoilBlue,
                        imagePathOpacity: 0.12,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 24,
                    bottom: 12,
                  ),
                  child: Text(
                    "Favourites",
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontSize: 16,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 95,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return const ReusableFavouriteContainer(
                                  fuelStation: 'NNpc',
                                  location: 'Ikotun',
                                  status: 'Closed',
                                  rating: '3.9(33)',
                                  isClosed: true,
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 24,
                    bottom: 16,
                  ),
                  child: Text(
                    "Purchases",
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontSize: 16,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BuyGasScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    padding: const EdgeInsets.only(
                      top: 8,
                      left: 8,
                      right: 8,
                      bottom: 16,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: shadowLightGray.withOpacity(0.28),
                          blurRadius: 24,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const CustomImage(asset: fuelPumpBig),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Buy Gas",
                                style: theme.textTheme.labelLarge?.copyWith(
                                  fontSize: 14,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: theme.colorScheme.onSurface,
                                size: 18,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  RangeValues _currentPriceRangeValues = const RangeValues(200, 500);
  RangeValues _currentDistanceRangeValues = const RangeValues(1, 200);

  filterBottomSheet() {
    final theme = Theme.of(context);
    BottomSheetFunction.showCustomBottomSheet(
      context: context,
      color: theme.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: const EdgeInsets.only(
              right: 20,
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap:(){
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: blueTabBarContainerColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Text(
              "Current Price Range",
              style: theme.textTheme.labelMedium!.copyWith(
                fontSize: 12,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 1,
                    ),
                    child: RangeSlider(
                      inactiveColor: borderColorLightGray,
                      activeColor: blueTabBarContainerColor,
                      values: _currentPriceRangeValues,
                      min: 0,
                      max: 2000,
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentPriceRangeValues = values;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    left: (_currentPriceRangeValues.start / 2000) *
                        (MediaQuery.of(context).size.width),
                    bottom: -4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "NGN ${_currentPriceRangeValues.start.round().toString()}/ltr",
                        style: theme.textTheme.labelMedium!.copyWith(
                          fontSize: 10,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: (_currentPriceRangeValues.end / 2000) *
                        (MediaQuery.of(context).size.width - 80),
                    bottom: -4,
                    child: Text(
                      "NGN ${_currentPriceRangeValues.end.round().toString()}/ltr",
                      style: theme.textTheme.labelMedium!.copyWith(
                        fontSize: 10,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Text(
              "Distance",
              style: theme.textTheme.labelMedium!.copyWith(
                fontSize: 12,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4, bottom: 20),
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 1,
                    ),
                    child: RangeSlider(
                      inactiveColor: borderColorLightGray,
                      activeColor: blueTabBarContainerColor,
                      values: _currentDistanceRangeValues,
                      min: 0,
                      max: 200,
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentDistanceRangeValues = values;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    left: (_currentDistanceRangeValues.start / 200) *
                        (MediaQuery.of(context).size.width),
                    bottom: -4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "${_currentDistanceRangeValues.start.round().toString()} mins away",
                        style: theme.textTheme.labelMedium!.copyWith(
                          fontSize: 10,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: (_currentDistanceRangeValues.end / 200) *
                        (MediaQuery.of(context).size.width - 80),
                    top: -4,
                    child: Text(
                      "${_currentDistanceRangeValues.end.round().toString()} mins away",
                      style: theme.textTheme.labelMedium!.copyWith(
                        fontSize: 10,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 8,),
            child: Text(
              "Ratings",
              style: theme.textTheme.labelMedium!.copyWith(
                fontSize: 12,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20,),
            child: Row(
              children: [
                Expanded(
                  child: ReusableRatingsContainer(
                    label: 'All',
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ReusableRatingsContainer(
                    label: '1',
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ReusableRatingsContainer(
                    label: '2',
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ReusableRatingsContainer(
                    label: '3',
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ReusableRatingsContainer(
                    label: '4',
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ReusableRatingsContainer(
                    label: '5',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Button(
              height: 56,
              title: "Apply",
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
