import 'package:flutter/material.dart';

import '../../../../featured brands/presentation/widgets/reusable_filling_station_container.dart';

class FavouritesPortion extends StatefulWidget {
  const FavouritesPortion({super.key,required this.reusableFillingStationContainerOnTap});
  final Function() reusableFillingStationContainerOnTap;

  @override
  State<FavouritesPortion> createState() => _FavouritesPortionState();
}

class _FavouritesPortionState extends State<FavouritesPortion> {
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
