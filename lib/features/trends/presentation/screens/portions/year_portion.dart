import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';

import '../../../../../core/presentation/widgets/reusable_current_price_container.dart';
import '../../../../bottom nav bar/presentation/widgets/legend_widgets.dart';

class YearPortion extends StatefulWidget {
  const YearPortion({super.key});

  @override
  State<YearPortion> createState() => _YearPortionState();
}

class _YearPortionState extends State<YearPortion> {
  String? selectedValue;
  List<String> listOfYear = ["Week 1", "Week 2", "Week 3", "Week 4"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFFD9D9D9),
                      )),
                  child: DropdownButton<String>(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    underline: Container(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF002933),
                    ),
                    hint: const Text(
                      "Selected Week",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF7F7F7F),
                      ),
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Color(0xFF002933),
                    ),
                    borderRadius: BorderRadius.circular(8),
                    value: selectedValue,
                    items: listOfYear.map<DropdownMenuItem<String>>((value) {
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
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Total Filling Station Prices",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xFF002933),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: getLegendWidgets(),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: Row(
                children: [
                  const RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      '(per ltr/per kg)',
                      style: TextStyle(
                          fontSize: 8,
                          color: Color(0xFF002933),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 300,
                      child: LineChart(
                        LineChartData(
                          backgroundColor: Colors.white,
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            horizontalInterval: 150,
                            verticalInterval: 1,
                            getDrawingHorizontalLine: (value) => const FlLine(
                              color: Color(0xFFCCCCCC),
                              strokeWidth: 1,
                            ),
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 1,
                                getTitlesWidget: bottomTitleWidgets,
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 300,
                                getTitlesWidget: leftTitleWidgets,
                                reservedSize: 60,
                              ),
                            ),
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: const Border(
                              top: BorderSide(
                                width: 1,
                                color: Color(0xFFCCCCCC),
                              ),
                              bottom: BorderSide(
                                width: 1,
                                color: Color(0xFFCCCCCC),
                              ),
                            ),
                          ),
                          minX: 0,
                          maxX: 6,
                          minY: 0,
                          maxY: 2100,
                          lineBarsData: [
                            buildLineChartBarData(
                              spots: const [
                                FlSpot(0, 2100),
                                FlSpot(1, 1800),
                                FlSpot(2, 1500),
                                FlSpot(3, 1700),
                                FlSpot(4, 1900),
                                FlSpot(5, 1600),
                                FlSpot(6, 1800),
                              ],
                              color: const Color(0xFF3377FF),
                            ),
                            buildLineChartBarData(
                              spots: const [
                                FlSpot(0, 1200),
                                FlSpot(1, 1300),
                                FlSpot(2, 1000),
                                FlSpot(3, 1400),
                                FlSpot(4, 1500),
                                FlSpot(5, 1100),
                                FlSpot(6, 1300),
                              ],
                              color: const Color(0xFFCC12DC),
                            ),
                            buildLineChartBarData(
                              spots: const [
                                FlSpot(0, 800),
                                FlSpot(1, 900),
                                FlSpot(2, 700),
                                FlSpot(3, 1000),
                                FlSpot(4, 1100),
                                FlSpot(5, 900),
                                FlSpot(6, 950),
                              ],
                              color: const Color(0xFF46A519),
                            ),
                            buildLineChartBarData(
                              spots: const [
                                FlSpot(0, 500),
                                FlSpot(1, 600),
                                FlSpot(2, 400),
                                FlSpot(3, 700),
                                FlSpot(4, 800),
                                FlSpot(5, 600),
                                FlSpot(6, 650),
                              ],
                              color: const Color(0xFF0ECBA9),
                            ),
                          ],
                          lineTouchData: LineTouchData(
                            enabled: true,
                            touchTooltipData: LineTouchTooltipData(
                              getTooltipItems: (touchedSpots) {
                                return touchedSpots.map((spot) {
                                  String lineName;
                                  switch (spot.barIndex) {
                                    case 0:
                                      lineName = 'Diesel';
                                      break;
                                    case 1:
                                      lineName = 'PMS';
                                      break;
                                    case 2:
                                      lineName = 'Kerosene';
                                      break;
                                    case 3:
                                      lineName = 'Cooking Gas';
                                      break;
                                    default:
                                      lineName = 'Unknown';
                                  }
                                  return LineTooltipItem(
                                    '$lineName\nNGN ${spot.y.toStringAsFixed(1)}',
                                    const TextStyle(color: Colors.white),
                                  );
                                }).toList();
                              },
                            ),
                            handleBuiltInTouches: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Average Price",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xFF002933),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Expanded(
                  child: ReusableCurrentPriceContainer(
                    productName: "Diesel",
                    productPrice: "NGN 1,820/ltr",
                    productStatusContainerColor: Color(0xFFEAFFEB),
                    productStatusIcon: gainIcon,
                    productStatusTextColor: Color(0xFF186A04),
                    productStatusNumber: "+4.4%",
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ReusableCurrentPriceContainer(
                    productName: 'PMS',
                    productPrice: 'NGN 820/ltr',
                    productStatusTextColor: Color(0xFF186A04),
                    productStatusIcon: gainIcon,
                    productStatusContainerColor: Color(0xFFEAFFEB),
                    productStatusNumber: "+4.4%",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              children: [
                Expanded(
                  child: ReusableCurrentPriceContainer(
                    productName: "Diesel",
                    productPrice: "NGN 1,820/ltr",
                    productStatusContainerColor: Color(0xFFFFF8EE),
                    productStatusIcon: lossIcon,
                    productStatusTextColor: Color(0xFFF23006),
                    productStatusNumber: '-3.4%',
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ReusableCurrentPriceContainer(
                    productName: 'PMS',
                    productPrice: 'NGN 820/ltr',
                    productStatusTextColor: Color(0xFF186A04),
                    productStatusIcon: gainIcon,
                    productStatusContainerColor: Color(0xFFEAFFEB),
                    productStatusNumber: "+4.4%",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  LineChartBarData buildLineChartBarData({
    required List<FlSpot> spots,
    required Color color,
  }) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      curveSmoothness: 0.5,
      color: color,
      barWidth: 4,
      isStrokeCapRound: true,
      belowBarData: BarAreaData(
        show: false,
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xFF4B4B4B));
    List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    Widget text = Text(days[value.toInt()], style: style);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.w700, fontSize: 10, color: Color(0xFF002933));
    String text = 'NGN ${value.toInt()}';

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8,
      child: Text(text, style: style),
    );
  }
}
