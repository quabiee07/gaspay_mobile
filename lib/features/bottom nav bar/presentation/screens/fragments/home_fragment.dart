import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/widgets/custom_image.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:gaspay_mobile/features/notification/presentation/screens/notification_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import '../../../../../core/presentation/resources/drawables.dart';
import '../../../../../core/presentation/theme/colors/colors.dart';
import '../../../../../core/presentation/widgets/bottom_sheet_function.dart';
import '../../../../../core/presentation/widgets/button.dart';
import '../../../../../core/presentation/widgets/reusable_brand_container.dart';
import '../../../../../core/presentation/widgets/reusable_favourite_container.dart';
import '../../../../add to cart/presentation/widgets/reusable_ratings_container.dart';
import '../../../../buy gas/presentation/screens/buy_gas_screen.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({
    super.key,
  });

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

final GlobalKey loanKey = GlobalKey();
final GlobalKey _profileKey = GlobalKey();
final GlobalKey _searchKey = GlobalKey();
final GlobalKey _notificationKey = GlobalKey();
final GlobalKey _filterKey = GlobalKey();
final GlobalKey _buyGasKey = GlobalKey();


bool isSearching = false;

class _HomeFragmentState extends State<HomeFragment> {
  TutorialCoachMark? tutorialCoachMark;
  List<TargetFocus> targets = [];


  Future<void> _checkIfTourShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenTour = prefs.getBool('hasSeenTour') ?? false;

    if (!hasSeenTour) {
      _showCoachMark();
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      _checkIfTourShown();
    });

    super.initState();
  }

  Future<void> _markTourAsFinished() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenTour', true);
  }

  void _showCoachMark() {
    _initTarget();
    tutorialCoachMark = TutorialCoachMark(
        targets: targets,
        hideSkip: true,
        onFinish: () async {
          await _markTourAsFinished();
        },
        onSkip: () {
          _markTourAsFinished();
          return true;
        })
      ..show(context: context);
  }

  void _initTarget() {
    targets = [
      TargetFocus(identify: "profile-key", keyTarget: _profileKey, contents: [
        TargetContent(builder: (context, controller) {
          return CoachMarkDesc(
            title: "View profile",
            description: "Tap to view your profile, settings and more",
            onNext: () {
              controller.next();
            },
            onSkip: () {
              controller.skip();
            },
          );
        }),
      ]),
      TargetFocus(identify: "search-key", keyTarget: _searchKey, contents: [
        TargetContent(builder: (context, controller) {
          return CoachMarkDesc(
            title: "Use search",
            description: "Tap to search for any filling station of your choice",
            onNext: () {
              controller.next();
            },
            onSkip: () {
              controller.skip();
            },
          );
        }),
      ]),
      TargetFocus(
          identify: "notification-key",
          keyTarget: _notificationKey,
          contents: [
            TargetContent(builder: (context, controller) {
              return CoachMarkDesc(
                title: "View notification",
                description: "Tap to view your notifications",
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            }),
          ]),
      TargetFocus(identify: "filter-key", keyTarget: _filterKey, contents: [
        TargetContent(builder: (context, controller) {
          return CoachMarkDesc(
            title: "Use sort",
            description: "Tap to filter search",
            onNext: () {
              controller.next();
            },
            onSkip: () {
              controller.skip();
            },
          );
        }),
      ]),
      TargetFocus(
          identify: "buyGas-key",
          keyTarget: _buyGasKey,
          shape: ShapeLightFocus.RRect,
          contents: [
            TargetContent(
                align: ContentAlign.top,
                builder: (context, controller) {
                  return CoachMarkDesc(
                    title: "Buy Gas",
                    description: "Discover stations closest to you",
                    onNext: () {
                      controller.next();
                    },
                    onSkip: () {
                      controller.skip();
                    },
                  );
                }),
          ]),
      TargetFocus(identify: "loan-key", keyTarget: loanKey, contents: [
        TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return CoachMarkDesc(
                title: "Loans",
                description: "Take a loan to buy fuel and pay later",
                next: "Finish",
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            }),
      ]),
    ];
  }

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
              children: [
                Column(
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
                                          style: theme.textTheme.labelSmall
                                              ?.copyWith(
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
                                    CircleAvatar(
                                      key: _profileKey,
                                      backgroundImage: const AssetImage(
                                        profilePic,
                                      ),
                                      radius: 20,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Albrighton",
                                          style: theme.textTheme.labelLarge
                                              ?.copyWith(
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
                                                style: theme
                                                    .textTheme.labelMedium
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
                                      child: Column(
                                        children: [
                                          SvgImage(
                                            key: _searchKey,
                                            asset: searchIcon,
                                          ),
                                        ],
                                      ),
                                    ),
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
                                      child: Column(
                                        children: [
                                          SvgImage(
                                            key: _notificationKey,
                                            asset: notificationIcon,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 22,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        filterBottomSheet();
                                      },
                                      child: Column(
                                        children: [
                                          SvgImage(
                                            key: _filterKey,
                                            asset: filterIcon,
                                          ),
                                        ],
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
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
                      child: Column(
                        children: [
                          Container(
                            key: _buyGasKey,
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
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Buy Gas",
                                        style: theme.textTheme.labelLarge
                                            ?.copyWith(
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
                        ],
                      ),
                    )
                  ],
                ),
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
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
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
                      onTap: () {
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
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: Text(
                  "Current Price Range",
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontSize: 12,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
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
                        bottom: -6,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
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
                        top: -6,
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
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
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
                        bottom: -6,
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
                        top: -6,
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
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 20,
                  right: 20,
                  bottom: 8,
                ),
                child: Text(
                  "Ratings",
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontSize: 12,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
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
          );
        },
      ),
    );
  }
}

class CoachMarkDesc extends StatefulWidget {
  const CoachMarkDesc({
    super.key,
    required this.title,
    required this.description,
    required this.onNext,
    required this.onSkip,
    this.next = "Next",
  });

  final String title;
  final String description;
  final Function() onSkip;
  final Function() onNext;
  final String next;

  @override
  State<CoachMarkDesc> createState() => _CoachMarkDescState();
}

class _CoachMarkDescState extends State<CoachMarkDesc> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: theme.textTheme.labelLarge!.copyWith(
              fontSize: 14,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const Gap(2),
          Text(
            widget.description,
            style: theme.textTheme.labelSmall!.copyWith(
              fontSize: 12,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: widget.onSkip,
                child: Text(
                  "Skip",
                  style: theme.textTheme.labelLarge!.copyWith(
                    fontSize: 14,
                    color: blueTabBarContainerColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: widget.onNext,
                child: Text(
                  widget.next,
                  style: theme.textTheme.labelLarge!.copyWith(
                    fontSize: 14,
                    color: blueTabBarContainerColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
