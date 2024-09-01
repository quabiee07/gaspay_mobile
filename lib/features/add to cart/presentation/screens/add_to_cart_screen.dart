import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:gaspay_mobile/features/add%20to%20cart/presentation/screens/portions/engine_oil_portion.dart';
import 'package:gaspay_mobile/features/add%20to%20cart/presentation/screens/portions/fuel_portion.dart';
import '../../../../core/presentation/resources/drawables.dart';
import '../../../../core/presentation/theme/colors/colors.dart';
import '../../../../core/presentation/widgets/reusable_back_button_with_title.dart';
import '../widgets/reusable_horizontal_divider.dart';
import 'featured_filling_station_see_more_screen.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({
    super.key,
  });

  @override
  State<AddToCartScreen> createState() =>
      _AddToCartScreenState();
}

class _AddToCartScreenState
    extends State<AddToCartScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  int newIndex = 0;
  bool isSearching = false;

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    tabController.addListener(() {
      setState(() {
        newIndex = tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20,),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              isSearching
                  ? Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 3,
                ),
                decoration:  BoxDecoration(
                  color: theme.colorScheme.surface,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search Product',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: textExtraLightGray,
                    ),
                    prefixIcon:const  Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 12),
                          child: SvgImage(asset: smallSearchIcon,)
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
                            child:  Text(
                              'Cancel',
                              style: theme.textTheme.labelSmall?.copyWith(
                                fontSize: 14,
                                color: theme.colorScheme.onSurface,
                              )
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
                child: ReusableBackButtonWithTitle(
                  isBackIconVisible: true,
                  title: "Total Filling Station",
                  isText: true,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      "Smith Roundabout",
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 16,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSearching = true;
                            });
                          },
                          child: const SvgImage(asset: searchIcon,),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                       const SvgImage(asset: thickStrokeHeartIcon,),
                        const SizedBox(
                          width: 16,
                        ),
                       const SvgImage(asset: shareIcon,),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,),
                child: Row(
                  children: [
                     Text(
                      "40-50 mins away",
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 12,
                        color: orderTabTextDarkGray
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const ReusableHorizontalDivider(),
                    const SizedBox(
                      width: 6,
                    ),
                     Text(
                      "Opens 9am",
                      style: theme.textTheme.labelMedium?.copyWith(
                          fontSize: 12,
                          color: orderTabTextDarkGray
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const ReusableHorizontalDivider(),
                    const SizedBox(
                      width: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SvgImage(asset: bigStarIcon),
                        const SizedBox(
                          width: 2,
                        ),
                         Text(
                          "3.9(33)",
                          style: theme.textTheme.labelMedium?.copyWith(
                              fontSize: 12,
                              color: orderTabTextDarkGray
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                const FeaturedFillingStationSeeMoreScreen(),
                              ),
                            );
                          },
                          child:  Text(
                            "See more",
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontSize: 12,
                              color: blueTabBarContainerColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
                thickness: 1,
                color:lightGrayTabBarContainerColor,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                ),
                child: TabBar(
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 2,
                      color: blueTabBarContainerColor,
                    ),
                    insets: EdgeInsets.only(
                      bottom: 8,
                    ),
                  ),
                  tabAlignment: TabAlignment.center,
                  indicatorSize: TabBarIndicatorSize.label,
                  overlayColor: WidgetStateColor.transparent,
                  dividerColor: Colors.transparent,
                  controller: tabController,
                  labelColor: blueTabBarContainerColor,
                  unselectedLabelColor: theme.colorScheme.onSurface.withOpacity(0.50),
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                  tabs: const [
                    Tab(
                      child: Text("Fuel"),
                    ),
                    Tab(
                      child: Text("Engine Oil"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                    controller: tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children:  [
                      const FuelPortion(),
                      EngineOilPortion(context: context,),
                    ]),
              ),
            ]),
          )),
    );
  }
}



