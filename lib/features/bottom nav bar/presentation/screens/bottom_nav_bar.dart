import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'fragments/home_fragment.dart';
import 'fragments/loans_fragment.dart';
import 'fragments/order_fragment.dart';
import 'fragments/profile_fragment.dart';
import 'fragments/trend_fragment.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List pages = [
    const HomeFragment(),
    const OrderFragment(),
    const TrendFragment(),
    const LoansFragment(),
    const ProfileFragment(),
  ];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xFF1875F7),
        showSelectedLabels: true,
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xFF768589),
        ),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/inActiveHomeIcon.svg"),
            activeIcon: SvgPicture.asset("assets/images/activeHomeIcon.svg"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/inActiveOrderIcon.svg"),
            activeIcon: SvgPicture.asset("assets/images/activeOrderIcon.svg"),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/inActiveTrendsIcon.svg"),
            activeIcon: SvgPicture.asset("assets/images/activeTrendsIcon.svg"),
            label: "Trend",
          ),
          BottomNavigationBarItem(
            key: loanKey,
            icon: SvgPicture.asset("assets/images/inActiveLoansIcon.svg"),
            activeIcon: SvgPicture.asset("assets/images/activeLoansIcon.svg"),
            label: "Loans",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/inActiveProfileIcon.svg"),
            activeIcon: SvgPicture.asset("assets/images/activeProfileIcon.svg"),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
