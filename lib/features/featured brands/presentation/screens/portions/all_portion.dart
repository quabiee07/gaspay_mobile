import 'package:flutter/material.dart';

import '../../../../../core/presentation/resources/drawables.dart';
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

class FeaturedBrands {
  FeaturedBrands({
    required this.image,
    required this.isLiked,
    required this.location,
    required this.status,
    required this.rating,
  });

  bool isLiked = false;
  final String location;
  final String status;
  final String image;
  final String rating;

  static List<FeaturedBrands> allFeatureBrand = [
    FeaturedBrands(
      image: bigTotalLogo,
      isLiked: false,
      location: "Smith Roundabout",
      status: '40-45 min',
      rating: '3,9(33)',
    ),
    FeaturedBrands(
      image: bigTotalLogo,
      isLiked: false,
      location: "Smith Roundabout",
      status: '40-45 min',
      rating: '3,9(33)',
    ),
    FeaturedBrands(
      image: bigTotalLogo,
      isLiked: false,
      location: "Diesel",
      status: '40-45 min',
      rating: '3,9(33)',
    ),
    FeaturedBrands(
      image: bigTotalLogo,
      isLiked: false,
      location: "Diesel",
      status: '40-45 min',
      rating: '3,9(33)',
    ),
  ];
}
