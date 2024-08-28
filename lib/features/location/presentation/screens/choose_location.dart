import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/utils/custom_state.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/utils/snack_bar_utils.dart';
import 'package:gaspay_mobile/core/presentation/widgets/clickable.dart';
import 'package:gaspay_mobile/core/presentation/widgets/input_field.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:gaspay_mobile/features/location/presentation/manager/location_provider.dart';
import 'package:gaspay_mobile/features/location/presentation/screens/enable_location.dart';
import 'package:gaspay_mobile/features/location/presentation/screens/pick_location.dart';

class ChooseLocationScreen extends StatefulWidget {
  const ChooseLocationScreen({super.key});
  static const String id = '/choose-location';

  @override
  State<ChooseLocationScreen> createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends CustomState<ChooseLocationScreen> {
  LocationProvider? _provider;

  @override
  void onStarted() {
    _provider?.listen((event) async {
      if (event == 0) {
        context.push(const EnableLocationScreen());
        showWarning('Location services must be enabled to continue');
      } else if (event == 1) {
        showSuccess('Location services enabled!');
      }
    });
    super.onStarted();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      provider: LocationProvider(),
      children: (provider, theme) {
        _provider ?? provider;
        return [
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Choose location',
                style: theme.textTheme.titleSmall?.copyWith(fontSize: 15),
              ),
              const Icon(Icons.close),
            ],
          ),
          const Gap(10),
          Divider(
            color: theme.colorScheme.secondary,
          ),
          const Gap(15),
          InputField2(
            hint: 'Search',
            borderRadius: 100,
            onChange: (value) {},
          ),
          const Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Clickable(
                onPressed: () {
                  context.push(const PickLocationScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xFFF2F7FF)),
                  child: Row(
                    children: [
                      const SvgImage(asset: icLocation1),
                      const Gap(8),
                      Text(
                        'Add with map',
                        style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 12, color: theme.colorScheme.primary),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const Gap(20),
          SizedBox(
            height: 20,
            child: Row(
              children: [
                const SvgImage(asset: icLocation3),
                const Gap(8),
                Text(
                  'Use your current location',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          Divider(
            color: theme.colorScheme.secondary,
          ),
          const Gap(16),
          Expanded(
            child: Column(
              children: List.generate(
                5,
                (index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SvgImage(asset: icLocation2),
                            const Gap(8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '10 Creighton Bank, East Port-Harcourt',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                                const Gap(6),
                                Text(
                                  '10 Creighton Bank Avenue, Rivers, Nigeria',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                      fontSize: 8,
                                      color: const Color(0xFF556062)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Gap(16),
                      Divider(
                        color: theme.colorScheme.secondary,
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ];
      },
    );
  }
}
