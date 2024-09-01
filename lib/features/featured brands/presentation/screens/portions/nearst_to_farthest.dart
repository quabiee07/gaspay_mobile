import 'package:flutter/material.dart';

import '../../widgets/reusable_filling_station_container.dart';

class NearestOfFarthestPortion extends StatefulWidget {
  const NearestOfFarthestPortion(
      {super.key, required this.reusableFillingStationContainerOnTap});

  final Function() reusableFillingStationContainerOnTap;

  @override
  State<NearestOfFarthestPortion> createState() =>
      _NearestOfFarthestPortionState();
}

class _NearestOfFarthestPortionState
    extends State<NearestOfFarthestPortion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ReusableFillingStationContainer(
                    location: 'Smith Roundabout',
                    status: '40-45 min',
                    rating: '3,9(33)',
                    onTap: widget.reusableFillingStationContainerOnTap,
                  );
                }),
          )
        ],
      ),
    );
  }
}
