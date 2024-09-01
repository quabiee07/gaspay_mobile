import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';

import '../../../../../core/presentation/resources/drawables.dart';
import '../../../../../core/presentation/theme/colors/colors.dart';
import '../../../../../core/presentation/widgets/reusable_back_button_with_title.dart';
import '../../../../order/presentation/screens/portion/expired_portion.dart';
import '../../../../order/presentation/screens/portion/pending_portion.dart';
import '../../../../order/presentation/screens/portion/redeemed_portion.dart';

class OrderFragment extends StatefulWidget {
  const OrderFragment({super.key});

  @override
  State<OrderFragment> createState() => _OrderFragmentState();
}

class _OrderFragmentState extends State<OrderFragment>
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Column(
          children: [
            ReusableBackButtonWithTitle(
              isText: true,
              title: "Order",
              onTap: () {},
              isBackIconVisible: false,
              prefixWidget: const SizedBox.shrink(),
              suffixWidget: const SvgImage(asset: archiveIcon),
            ),
            const SizedBox(
              height: 20,
            ),
            TabBar(
              indicator:  UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2,
                  color: theme.colorScheme.primary,
                ),
                insets: const EdgeInsets.only(
                  bottom: 8,
                ),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              tabAlignment: TabAlignment.center,
              overlayColor: WidgetStateColor.transparent,
              dividerColor: const Color(0xFFE6E6E6),
              controller: tabController,
              labelColor:  theme.colorScheme.primary,
              unselectedLabelColor: orderTabTextDarkGray,
              labelStyle: theme.textTheme.labelMedium?.copyWith(
                fontSize: 12,
              ),
              unselectedLabelStyle: theme.textTheme.labelMedium?.copyWith(
                fontSize: 12,
              ),
              tabs: const [
                Tab(
                  text: "Pending",
                ),
                Tab(
                  text: "Redeemed",
                ),
                Tab(
                  text: "Expired",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: const [
                    PendingPortion(),
                    RedeemedPortion(),
                    ExpiredPortion(),
                  ]),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
