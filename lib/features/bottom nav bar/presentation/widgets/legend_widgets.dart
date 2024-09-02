import 'package:flutter/material.dart';

Widget _buildLegendItem(Color color, String text) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: color,
          borderRadius:
          BorderRadius.circular(2),
        ),
      ),
      const SizedBox(width: 8),
      Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xFF002933)),
      ),
    ],
  );
}

List<Widget> getLegendWidgets() {
  return [
    _buildLegendItem(
      const Color(0xFF3377FF),
      "Diesel",
    ),
    _buildLegendItem(
      const Color(0xFFCC12DC),
      "PMS",
    ),
    _buildLegendItem(
      const Color(0xFF46A519),
      "Kerosene",
    ),
    _buildLegendItem(
      const Color(0xFF0ECBA9),
      "Cooking Gas",
    ),
  ];
}