import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../featured brands/presentation/widgets/reusable_filling_station_container.dart';

class AllFragments extends StatefulWidget {
  const AllFragments({super.key,required this.reusableFillingStationContainerOnTap});
  final Function() reusableFillingStationContainerOnTap;

  @override
  State<AllFragments> createState() => _AllFragmentsState();
}

class _AllFragmentsState extends State<AllFragments> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 20,right: 20,),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return  ReusableFillingStationContainer(
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

