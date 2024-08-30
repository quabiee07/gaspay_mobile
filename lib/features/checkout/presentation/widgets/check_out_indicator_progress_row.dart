import 'package:flutter/material.dart';

import 'check_out_stage_indicator.dart';

class CheckOutIndicatorProgressRow extends StatelessWidget {
  const CheckOutIndicatorProgressRow({
    super.key,
    required int currentPage,
  }) : _currentPage = currentPage;

  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: CheckOutStageIndicator(
              index: _currentPage,
              position: 0,
              horizontal: 90,
              isSecondPosition: false,
              label: "1",
            ),
          ),
          Expanded(
            child: Column(
              children: [
                CheckOutStageIndicator(
                  index: _currentPage,
                  position: 1,
                  horizontal: 90,
                  isSecondPosition: true,
                  label: '2',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
