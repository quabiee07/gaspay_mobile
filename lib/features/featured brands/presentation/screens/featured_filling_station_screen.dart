import 'package:flutter/material.dart';
import 'package:gaspay_mobile/features/add%20to%20cart/presentation/screens/add_to_cart_screen.dart';
import 'package:gaspay_mobile/features/featured%20brands/presentation/screens/portions/all_portion.dart';
import 'package:gaspay_mobile/features/featured%20brands/presentation/screens/portions/nearst_to_farthest.dart';

import '../../../../core/presentation/theme/colors/colors.dart';
import '../../../../core/presentation/widgets/reusable_back_button_with_title.dart';

class FeaturedFillingStationScreen extends StatefulWidget {
  const FeaturedFillingStationScreen({super.key});

  @override
  State<FeaturedFillingStationScreen> createState() =>
      _FeaturedFillingStationScreenState();
}

class _FeaturedFillingStationScreenState
    extends State<FeaturedFillingStationScreen> with TickerProviderStateMixin {
  late TabController tabController;
  int newIndex = 0;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 20,
              ),
              child: ReusableBackButtonWithTitle(
                  isText: false,
                  title: "",
                  onTap: () {
                    Navigator.pop(context);
                  },
                  isBackIconVisible: true),
            ),
            const SizedBox(
              height: 20,
            ),
             Padding(
              padding:const  EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "Total Filling Station Near You",
                style: theme.textTheme.labelLarge?.copyWith(
                  fontSize: 14,
                  color: theme.colorScheme.onSurface
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: TabBar(
                indicator: const BoxDecoration(
                  color: transparent,
                ),
                tabAlignment: TabAlignment.center,
                overlayColor: WidgetStateColor.transparent,
                dividerColor: Colors.transparent,
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                labelColor: theme.colorScheme.surface,
                unselectedLabelColor: theme.colorScheme.onSurface.withOpacity(0.50),
                labelStyle: theme.textTheme.labelMedium?.copyWith(
                    fontSize: 12,
                    color: theme.colorScheme.onSurface
                ),
                unselectedLabelStyle:theme.textTheme.labelMedium?.copyWith(
                    fontSize: 12,
                    color: theme.colorScheme.onSurface
                ),
                tabs: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: newIndex == 0
                            ?  blueTabBarContainerColor
                            :  lightGrayTabBarContainerColor,),
                    child: const Column(
                      children: [Text("All")],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: newIndex == 1
                          ? blueTabBarContainerColor
                          : lightGrayTabBarContainerColor,
                    ),
                    child: const Text("Nearest to Farthest"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                AllPortion(
                  reusableFillingStationContainerOnTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                        const AddToCartScreen(),
                      ),
                    );
                  },
                ),
                NearestOfFarthestPortion(
                  reusableFillingStationContainerOnTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                        const AddToCartScreen(),
                      ),
                    );
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
