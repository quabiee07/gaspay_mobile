import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/widgets/custom_image.dart';
import 'package:gaspay_mobile/core/presentation/widgets/grey_container_divider.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/features/auth/presentation/manager/login_provider.dart';

import '../../../../../core/presentation/resources/drawables.dart';
import '../../../../../core/presentation/theme/colors/colors.dart';
import '../../../../../core/presentation/widgets/reusable_back_button_with_title.dart';
import '../../../../../core/presentation/widgets/reusable_blog_content_column.dart';
import '../../../../../core/presentation/widgets/reusable_current_price_container.dart';
import '../../../../trends/presentation/screens/view_trends_screen.dart';
import '../../widgets/legend_widgets.dart';

class TrendFragment extends StatefulWidget {
  const TrendFragment({super.key});

  @override
  State<TrendFragment> createState() => _TrendFragmentState();
}

class _TrendFragmentState extends State<TrendFragment> {
  String? selectedValue;
  List<String> listOfBrands = [
    "Ap",
    "Conoil",
    "Mobil",
    "NNPC",
    "Shell",
    "Total"
  ];

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      padding: 0,
      provider: LoginProvider(),
      children: (provider, theme) {
        return [
          const Gap(20),
          ReusableBackButtonWithTitle(
            isText: true,
            title: "Trends",
            onTap: () {},
            isBackIconVisible: false,
            suffixWidget: const SizedBox.shrink(),
            prefixWidget: const SizedBox.shrink(),
          ),
          const Gap(10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GreyContainerDivider(),
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: theme.colorScheme.surface,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Trending Fuel Prices",
                                style: theme.textTheme.labelMedium?.copyWith(
                                  fontSize: 16,
                                  color: theme.colorScheme.onSurface,
                                )),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                  color: theme.colorScheme.surface,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: borderColorLightGray,
                                  )),
                              child: DropdownButton<String>(
                                underline: Container(),
                                style: theme.textTheme.labelMedium?.copyWith(
                                  fontSize: 12,
                                  color: theme.colorScheme.onSurface,
                                ),
                                hint: Text("Select Brand",
                                    style:
                                        theme.textTheme.labelMedium?.copyWith(
                                      fontSize: 10,
                                      color: dropDownTextDarkGray,
                                    )),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: theme.colorScheme.onSurface,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                value: selectedValue,
                                items: listOfBrands
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedValue = newValue;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Text(
                          "Total Filling Station",
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontSize: 14,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          padding: const EdgeInsets.symmetric(vertical: 28),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: totalPink.withOpacity(
                              0.20,
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImage(
                                asset: bigTotalLogo,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Current",
                              style: theme.textTheme.labelMedium?.copyWith(
                                fontSize: 12,
                                color: textMediumGray,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ViewTrendsScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "View Trends",
                                style: theme.textTheme.labelMedium?.copyWith(
                                  fontSize: 12,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(10),
                        const Row(
                          children: [
                            Expanded(
                              child: ReusableCurrentPriceContainer(
                                productName: "Diesel",
                                productPrice: "NGN 1,820/ltr",
                                productStatusContainerColor: greenGainingColor,
                                productStatusIcon: gainIcon,
                                productStatusTextColor: darkGreen,
                                productStatusNumber: "+4.4%",
                              ),
                            ),
                            Gap(8),
                            Expanded(
                              child: ReusableCurrentPriceContainer(
                                productName: 'PMS',
                                productPrice: 'NGN 820/ltr',
                                productStatusTextColor: darkGreen,
                                productStatusIcon: gainIcon,
                                productStatusContainerColor: greenGainingColor,
                                productStatusNumber: "+4.4%",
                              ),
                            ),
                          ],
                        ),
                        const Gap(10),
                        const Row(
                          children: [
                            Expanded(
                              child: ReusableCurrentPriceContainer(
                                productName: "Diesel",
                                productPrice: "NGN 1,820/ltr",
                                productStatusContainerColor:
                                    redLosingBackgroundColor,
                                productStatusIcon: lossIcon,
                                productStatusTextColor: redLosingColor,
                                productStatusNumber: '-3.4%',
                              ),
                            ),
                            Gap(8),
                            Expanded(
                              child: ReusableCurrentPriceContainer(
                                productName: 'PMS',
                                productPrice: 'NGN 820/ltr',
                                productStatusTextColor: darkGreen,
                                productStatusIcon: gainIcon,
                                productStatusContainerColor: greenGainingColor,
                                productStatusNumber: "+4.4%",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  const GreyContainerDivider(),
                  const Gap(10),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your Top Purchases",
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontSize: 16,
                              color: theme.colorScheme.onSurface,
                            )),
                        const Gap(20),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20,
                          ),
                          child: Center(
                            child: Wrap(
                              spacing: 16,
                              runSpacing: 8,
                              children: getLegendWidgets(),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            color: Colors.transparent,
                            height: 200,
                            child: PieChart(
                              PieChartData(
                                sections: _getSections(),
                                sectionsSpace: 4,
                                centerSpaceRadius: 40,
                                borderData: FlBorderData(show: false),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  const GreyContainerDivider(),
                  const Gap(10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    color: theme.colorScheme.surface,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: theme.colorScheme.primary,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 2,
                            ),
                            child: Text("Blogs",
                                style: theme.textTheme.labelMedium?.copyWith(
                                    fontSize: 16,
                                    color: theme.colorScheme.primary)),
                          ),
                        ),
                        const Gap(14),
                        const ReusableBlogContentColumn(
                          blogTopic: "Fuels Consumption Tips",
                          highlightBlogTopic:
                              "Energy Efficiency: Tips for Reducing Fuel, Diesel, Kerosene, and Cooking Gas Consumption.",
                          blogWriteUp:
                              'In a world where energy costs are rising and environmental concerns are growing, efficient energy usage has become more important than ever. Whether you rely on fuel for your vehicle, diesel for heavy machinery, kerosene for heating, or cooking gas in your kitchen, there are numerous ways to reduce consumption and save both money and resources. Here are some practical tips to help you use these energy sources more efficiently.',
                        ),
                        const Gap(14),
                        Divider(
                          height: 1,
                          color: theme.colorScheme.secondary,
                        ),
                        const Gap(24),
                        const ReusableBlogContentColumn(
                          blogTopic: "Fuels Consumption Tips",
                          highlightBlogTopic:
                              "Energy Efficiency: Tips for Reducing Fuel, Diesel, Kerosene, and Cooking Gas Consumption.",
                          blogWriteUp:
                              'In a world where energy costs are rising and environmental concerns are growing, efficient energy usage has become more important than ever. Whether you rely on fuel for your vehicle, diesel for heavy machinery, kerosene for heating, or cooking gas in your kitchen, there are numerous ways to reduce consumption and save both money and resources. Here are some practical tips to help you use these energy sources more efficiently.',
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  const GreyContainerDivider(height: 32),
                  const Gap(10),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(20),
                    color: theme.colorScheme.surface,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Filling Stations Around You",
                          style: theme.textTheme.labelMedium?.copyWith(
                              fontSize: 16, color: theme.colorScheme.primary),
                        ),
                        const Gap(20),
                        const Center(
                          child: CustomImage(
                            asset: map,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const GreyContainerDivider(height: 18),
                ],
              ),
            ),
          ),
        ];
      },
    );
  }

  List<PieChartSectionData> _getSections() {
    return [
      PieChartSectionData(
        value: 40,
        color: graphBlue,
        showTitle: false,
      ),
      PieChartSectionData(
        value: 30,
        color: graphPurple,
        showTitle: false,
      ),
      PieChartSectionData(
        value: 20,
        color: graphGreen,
        showTitle: false,
      ),
      PieChartSectionData(
        value: 10,
        color: graphMint,
        showTitle: false,
      ),
    ];
  }
}
