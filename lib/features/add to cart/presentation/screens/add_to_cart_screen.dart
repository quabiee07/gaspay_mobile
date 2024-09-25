import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:gaspay_mobile/features/add%20to%20cart/presentation/screens/portions/engine_oil_portion.dart';
import 'package:gaspay_mobile/features/add%20to%20cart/presentation/screens/portions/fuel_portion.dart';
import 'package:provider/provider.dart';
import '../../../../core/presentation/manager/comment_provider.dart';
import '../../../../core/presentation/resources/drawables.dart';
import '../../../../core/presentation/theme/colors/colors.dart';
import '../../../../core/presentation/widgets/button.dart';
import '../../../../core/presentation/widgets/custom_comment_text_field_container.dart';
import '../../../../core/presentation/widgets/reusable_back_button_with_title.dart';
import '../../../checkout/presentation/screens/check_out_screen.dart';
import '../manager/add_to_cart_list_provider.dart';
import '../widgets/reusable_horizontal_divider.dart';
import 'featured_filling_station_see_more_screen.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({
    super.key,
  });

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen>
    with TickerProviderStateMixin {
  AddToCartListProvider addToCartListProvider = AddToCartListProvider();
  late TabController tabController;
  int newIndex = 0;
  bool isSearching = false;
  late FocusNode _focusNode;
  late TextEditingController commentController;

  @override
  void initState() {
    _focusNode = FocusNode();
    final commentProvider =
        Provider.of<CommentsProvider>(context, listen: false);
    commentController =
        TextEditingController(text: commentProvider.commentAddToCart1);
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
  void dispose() {
    _focusNode.dispose();
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool visibleContainer = MediaQuery.of(context).viewInsets.bottom != 0;
    final commentProvider = Provider.of<CommentsProvider>(context);
    final addToCartListProvider = Provider.of<AddToCartListProvider>(context);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            isSearching
                ? Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
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
                        prefixIcon: const Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: SvgImage(
                                  asset: smallSearchIcon,
                                )),
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
                                child: Text('Cancel',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      fontSize: 14,
                                      color: theme.colorScheme.onSurface,
                                    )),
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
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
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
                        child: const SvgImage(
                          asset: searchIcon,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const SvgImage(
                        asset: thickStrokeHeartIcon,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const SvgImage(
                        asset: shareIcon,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                children: [
                  Text(
                    "40-50 mins away",
                    style: theme.textTheme.labelMedium
                        ?.copyWith(fontSize: 12, color: orderTabTextDarkGray),
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
                    style: theme.textTheme.labelMedium
                        ?.copyWith(fontSize: 12, color: orderTabTextDarkGray),
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
                            fontSize: 12, color: orderTabTextDarkGray),
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
                        child: Text(
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
              color: lightGrayTabBarContainerColor,
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
                unselectedLabelColor:
                    theme.colorScheme.onSurface.withOpacity(0.50),
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
                  children: [
                    FuelPortion(
                      commentController: commentController,
                    ),
                    EngineOilPortion(
                      commentController: commentController,
                    ),
                  ]),
            ),
            if (context.watch<AddToCartListProvider>().items.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Comments",
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontSize: 16,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const Gap(10),
                    CustomCommentTextFieldContainer(
                      commentController: commentController,
                      onChange: (newComments) {
                        commentProvider.updateCommentFromCart1(newComments);
                      },
                      focusNode: _focusNode,
                    ),
                  ],
                ).animate().fadeIn(
                      duration: const Duration(milliseconds: 1000),
                    ),
              ),
            if (context.watch<AddToCartListProvider>().items.isNotEmpty)
              Visibility(
                visible: !visibleContainer,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 40,
                    top: 28,
                  ),
                  decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: colorBlack.withOpacity(0.25),
                          blurRadius: 18,
                          offset: const Offset(0, 2),
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Order Total(${context.watch<AddToCartListProvider>().items.length})",
                                  style: theme.textTheme.labelMedium?.copyWith(
                                      fontSize: 16, color: mediumGray2),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: blueTabBarContainerColor,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "NGN ${addToCartListProvider.getTotalAmount().toStringAsFixed(1)}",
                              style: theme.textTheme.labelLarge?.copyWith(
                                fontSize: 18,
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: CustomElevatedButton(
                            label: "Go to Cart",
                            onTap: () {
                              commentProvider.setCheckoutCommentFromCart(1);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const CheckOutScreen(),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ).animate().fadeIn(
                      duration: const Duration(milliseconds: 1000),
                    ),
              ),
          ]),
        ),
      ),
    );
  }
}
