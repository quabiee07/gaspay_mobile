import 'package:flutter/material.dart';
import 'package:gaspay_mobile/features/featured%20brands/presentation/screens/portions/all_portion.dart';

import '../../../../featured brands/presentation/widgets/reusable_filling_station_container.dart';

class NearestOtFarthestPortion extends StatefulWidget {
  const NearestOtFarthestPortion(
      {super.key, required this.reusableFillingStationContainerOnTap});

  final Function() reusableFillingStationContainerOnTap;

  @override
  State<NearestOtFarthestPortion> createState() =>
      _NearestOtFarthestPortionState();
}

class _NearestOtFarthestPortionState extends State<NearestOtFarthestPortion> {
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
                itemCount: FeaturedBrands.allFeatureBrand.length,
                itemBuilder: (context, index) {
                  return ReusableFillingStationContainer(
                    onTap: widget.reusableFillingStationContainerOnTap,
                    isLikedOnTap: () {
                      setState(() {
                        FeaturedBrands.allFeatureBrand[index].isLiked =
                            !FeaturedBrands.allFeatureBrand[index].isLiked;
                      });
                    },
                    featuredBrands: FeaturedBrands.allFeatureBrand[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}
