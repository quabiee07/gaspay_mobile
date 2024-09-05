import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gaspay_mobile/core/presentation/widgets/custom_tab_bar.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/features/auth/presentation/manager/login_provider.dart';
import 'package:gaspay_mobile/features/featured%20brands/presentation/screens/portions/all_portion.dart';


import '../../../../core/presentation/widgets/reusable_back_button_with_title.dart';
import 'buy_gas_add_to_cart_screen.dart';

class BuyGasScreen extends StatefulWidget {
  const BuyGasScreen({super.key});

  @override
  State<BuyGasScreen> createState() => _BuyGasScreenState();
}

class _BuyGasScreenState extends State<BuyGasScreen> {
  final title = ['All', 'Favourites', 'Nearest to Fartherst'];

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
        provider: LoginProvider(),
        children: (provider, theme) {
          return [
            ReusableBackButtonWithTitle(
              isText: true,
              title: "Buy Gas",
              onTap: () {
                Navigator.pop(context);
              },
              isBackIconVisible: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SvgPicture.asset("assets/images/blueLocationIcon.svg"),
                const SizedBox(
                  width: 4,
                ),
                Container(
                  color: Colors.transparent,
                  width: 150,
                  child: const Text(
                    "D498 oloye cresent,Royal Gradens",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF768589),
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: Color(0xFF768589),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTabWidget(
              tabTitles: List.generate(title.length, (index) {
                return title[index];
              }),
              children: List.generate(
                title.length,
                (index) {
                  //Since all the tab views are the same we can use only one wideget like so....
                  return AllPortion(
                    reusableFillingStationContainerOnTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const BuyGasAddToCartScreen(),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ];
        });
  }
}
