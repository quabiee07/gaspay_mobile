import 'package:flutter/material.dart';

import '../../widgets/reusable_filling_station_container.dart';

class AllPortion extends StatefulWidget {
  const AllPortion(
      {super.key, required this.reusableFillingStationContainerOnTap});

  final Function() reusableFillingStationContainerOnTap;

  @override
  State<AllPortion> createState() => _AllPortionState();
}

class _AllPortionState extends State<AllPortion> {
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
                    onTap: widget.reusableFillingStationContainerOnTap,
                    location: 'Smith Roundabout',
                    status: '40-45 min',
                    rating: '3,9(33)',
                  );
                }),
          )
        ],
      ),
    );
  }
}
