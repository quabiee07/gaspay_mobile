import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gaspay_mobile/features/buy%20gas/presentation/screens/portions/favourites_portion.dart';
import 'package:gaspay_mobile/features/featured%20brands/presentation/screens/portions/all_portion.dart';
import 'package:gaspay_mobile/features/featured%20brands/presentation/screens/portions/nearst_to_farthest.dart';

import '../../../../core/presentation/widgets/reusable_back_button_with_title.dart';
import 'buy_gas_add_to_cart_screen.dart';

class BuyGasScreen extends StatefulWidget {
  const BuyGasScreen({super.key});

  @override
  State<BuyGasScreen> createState() => _BuyGasScreenState();
}

class _BuyGasScreenState extends State<BuyGasScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  int newIndex = 0;

  @override
  void initState() {
    tabController = TabController(
      length: 3,
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
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ReusableBackButtonWithTitle(
                  isText: true,
                  title: "Buy Gas",
                  onTap: () {
                    Navigator.pop(context);
                  },
                  isBackIconVisible: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/blueLocationIcon.svg"),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      color: Colors.transparent,
                      width: 150,
                      child: const Text(
                        "D498 oloye cresent,Royal Gradens",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF768589),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Color(0xFF768589),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: TabBar(
                  indicator: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  isScrollable: false,
                  tabAlignment: TabAlignment.center,
                  overlayColor: WidgetStateColor.transparent,
                  dividerColor: Colors.transparent,
                  controller: tabController,
                  labelColor: const Color(0xFFFFFFFF),
                  unselectedLabelColor:
                  const Color(0xFF002933).withOpacity(0.50),
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                  tabs: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: newIndex == 0
                              ? const Color(0xFF1875F7)
                              : const Color(0xFFEDECEC)),
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
                            ? const Color(0xFF1875F7)
                            : const Color(0xFFEDECEC),
                      ),
                      child: const Text("Favourite"),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: newIndex == 2
                              ? const Color(0xFF1875F7)
                              : const Color(0xFFEDECEC)),
                      child: const Column(
                        children: [Text("Nearest to Farthest")],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      AllPortion(
                        reusableFillingStationContainerOnTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                              const BuyGasAddToCartScreen(),
                            ),
                          );
                        },
                      ),
                      // FavouritesPortion(
                      //   reusableFillingStationContainerOnTap: () {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: (context) =>
                      //         const BuyGasAddToCartScreen(),
                      //       ),
                      //     );
                      //   },
                      // ),
                      NearestOfFarthestPortion(
                        reusableFillingStationContainerOnTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                              const BuyGasAddToCartScreen(),
                            ),
                          );
                        },
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


