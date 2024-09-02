import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/presentation/resources/drawables.dart';
import '../../../../core/presentation/widgets/reusable_back_button_with_title.dart';
import '../widgets/reusable_customer_ratings_and_comment_column.dart';
import '../widgets/reusable_ratings_container.dart';

class RatingsScreen extends StatefulWidget {
  const RatingsScreen({super.key});

  @override
  State<RatingsScreen> createState() => _RatingsScreenState();
}

class _RatingsScreenState extends State<RatingsScreen> {
  List<double> rating = [
    0.1,
    0.5,
    0.3,
    0.6,
    0.9,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            20,
          ),
          child: Column(
            children: [
              ReusableBackButtonWithTitle(
                isBackIconVisible: true,
                title: "Ratings",
                isText: true,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                    color: const Color(0xFFFAFAFE),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: const Color(0xFF262626).withOpacity(0.10),
                        offset: const Offset(0, 10),
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 100,
                      child: ListView.builder(
                        itemCount: 5,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Text(
                                "${index + 1}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF002933),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const SvgImage(asset: bigStarIcon),
                              const SizedBox(
                                width: 4,
                              ),
                              LinearPercentIndicator(
                                lineHeight: 6.0,
                                backgroundColor: Colors.transparent,
                                progressColor: const Color(0xFF1875F7),
                                animationDuration: 700,
                                animation: true,
                                barRadius: const Radius.circular(8),
                                width: MediaQuery.of(context).size.width / 2.8,
                                percent: rating[index],
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    const Column(
                      children: [
                        Text(
                          "3.9",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 40,
                            color: Color(0xFF333333),
                          ),
                        ),
                        Row(
                          children: [
                            SvgImage(asset: bigStarIcon),
                            SizedBox(
                              width: 4,
                            ),
                            SvgImage(asset: bigStarIcon),
                            SizedBox(
                              width: 4,
                            ),
                            SvgImage(asset: bigStarIcon),
                            SizedBox(
                              width: 4,
                            ),
                            SvgImage(asset: bigStarIcon),
                            SizedBox(
                              width: 4,
                            ),
                            SvgImage(asset: bigStarIcon),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "33 Reviews",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableRatingsContainer(
                    label: 'All',
                  ),
                  ReusableRatingsContainer(
                    label: '1',
                  ),
                  ReusableRatingsContainer(
                    label: '2',
                  ),
                  ReusableRatingsContainer(
                    label: '3',
                  ),
                  ReusableRatingsContainer(
                    label: '4',
                  ),
                  ReusableRatingsContainer(
                    label: '5',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const ReusableCustomerRatingsAndCommentColumn(
                        customersName: 'Cynthia Morgan',
                        comment:
                            'I love the service I received on getting to the filling station',
                        date: 'August 8,2024',
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
