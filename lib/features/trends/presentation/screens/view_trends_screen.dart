import 'package:flutter/material.dart';
import 'package:gaspay_mobile/features/trends/presentation/screens/portions/month_portion.dart';
import 'package:gaspay_mobile/features/trends/presentation/screens/portions/this_week_portion.dart';
import 'package:gaspay_mobile/features/trends/presentation/screens/portions/year_portion.dart';

import '../../../../core/presentation/theme/colors/colors.dart';
import '../../../../core/presentation/widgets/reusable_back_button_with_title.dart';

class ViewTrendsScreen extends StatefulWidget {
  const ViewTrendsScreen({super.key});

  @override
  State<ViewTrendsScreen> createState() => _ViewTrendsScreenState();
}

class _ViewTrendsScreenState extends State<ViewTrendsScreen> with TickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this,);
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
                padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 12,),
                child: ReusableBackButtonWithTitle(isText: true, title: "View Trends", onTap: (){Navigator.pop(context);}, isBackIconVisible: true),
              ),
              Container(
                decoration: BoxDecoration(
                  color:const  Color(0xFFEDECEC),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(
                  20,
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: transparent,
                  controller: tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor:const  Color(0xFF002933).withOpacity(0.50),
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                  indicatorPadding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 5,
                    right:5,
                  ),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF1875F7),
                  ),
                  tabs: const  [
                    Tab(
                      text: "This Week",
                    ),
                    Tab(
                      text: "Month",
                    ),
                    Tab(
                      text: "All Time",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                    controller: tabController,
                    children: const  [
                      ThisWeekPortion(),
                      MonthPortion(),
                      YearPortion(),
                    ]),
              )
            ],
          )
      ),
    );
  }
}
