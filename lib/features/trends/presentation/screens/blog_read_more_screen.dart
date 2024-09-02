import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/reusable_back_button_with_title.dart';

class BlogReadMoreScreen extends StatefulWidget {
  const BlogReadMoreScreen({super.key});

  @override
  State<BlogReadMoreScreen> createState() => _BlogReadMoreScreenState();
}

class _BlogReadMoreScreenState extends State<BlogReadMoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ReusableBackButtonWithTitle(
                isText: true,
                title: "Fuel Consumption Tips",
                onTap: () {
                  Navigator.pop(context);
                },
                isBackIconVisible: true,
              ),
              const SizedBox(
                height: 36,
              ),
              Center(
                child: Image.asset(
                  "assets/images/fillingStationBlogPicture.png",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Energy Efficiency: Tips for Reducing Fuel, Diesel, Kerosene, and Cooking Gas Consumption.",
                style: TextStyle(
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF002933),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                  "In a world where energy costs are rising and environmental concerns are growing, efficient energy usage has become more important than ever. Whether you rely on fuel for your vehicle, diesel for heavy machinery, kerosene for heating, or cooking gas in your kitchen, there are numerous ways to reduce consumption and save both money and resources. Here are some practical tips to help you use these energy sources more efficiently.1. Fuel Consumption Tips for VehiclesFuel efficiency is key to reducing your vehicle’s carbon footprint and saving on costs. Here are some strategies to maximize your fuel efficiency:a.  Maintain Proper Tire Pressure Keeping your tires inflated to the manufacturer’s recommended pressure can improve fuel efficiency by up to 3%. Under-inflated tires increase rolling resistance, making your engine work harder and consume more fuel.b.  Drive Smoothly Avoid aggressive driving habits like rapid acceleration and hard braking. These behaviors can decrease your fuel efficiency by up to 40%. Instead, drive smoothly and maintain a steady speed.",
                  style: TextStyle(
                    height: 1.4,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF002933),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
