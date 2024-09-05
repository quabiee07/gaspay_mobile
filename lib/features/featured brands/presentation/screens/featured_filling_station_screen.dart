import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/widgets/custom_tab_bar.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/features/add%20to%20cart/presentation/screens/add_to_cart_screen.dart';
import 'package:gaspay_mobile/features/auth/presentation/manager/login_provider.dart';
import 'package:gaspay_mobile/features/featured%20brands/presentation/screens/portions/all_portion.dart';
import '../../../../core/presentation/widgets/reusable_back_button_with_title.dart';

class FeaturedFillingStationScreen extends StatefulWidget {
  const FeaturedFillingStationScreen({super.key});

  @override
  State<FeaturedFillingStationScreen> createState() =>
      _FeaturedFillingStationScreenState();
}

class _FeaturedFillingStationScreenState
    extends State<FeaturedFillingStationScreen> {
  final title = ['All', 'Nearest to Fartherst'];
  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
        provider: LoginProvider(),
        children: (provider, theme) {
          return [
            ReusableBackButtonWithTitle(
                isText: false,
                title: "",
                onTap: () {
                  Navigator.pop(context);
                },
                isBackIconVisible: true),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Total Filling Station Near You",
              style: theme.textTheme.labelLarge
                  ?.copyWith(fontSize: 14, color: theme.colorScheme.onSurface),
            ),
            const SizedBox(
              height: 20,
            ),
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
                          builder: (context) => const AddToCartScreen(),
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
