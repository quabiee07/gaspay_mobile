import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/utils/custom_state.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:gaspay_mobile/features/location/presentation/manager/location_provider.dart';
import 'package:gaspay_mobile/features/location/presentation/screens/choose_location.dart';
import 'package:location/location.dart';

class EnableLocationScreen extends StatefulWidget {
  const EnableLocationScreen({super.key});
  static const String id = '/enable-location';

  @override
  State<EnableLocationScreen> createState() => _EnableLocationScreenState();
}

class _EnableLocationScreenState extends CustomState<EnableLocationScreen> {
  LocationProvider? _provider;

  final Location location = Location();

  Future<void> _enableLocation(BuildContext context) async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ChooseLocationScreen()),
    );
  }

  @override
  void onStarted() {
    _provider?.listen((event) {});

    super.onStarted();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      provider: LocationProvider(),
      children: (provider, theme) {
        _provider ??= provider;
        return [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(child: SizedBox()),
                const SvgImage(asset: icEnableLocation),
                const Gap(40),
                Text(
                  'Enable Location',
                  style: theme.textTheme.titleLarge?.copyWith(fontSize: 22),
                ),
                const Gap(8),
                Text(
                  'We need this information to be able to locate the filling station closest to you.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 16, color: theme.colorScheme.onSecondary),
                ),
                const Expanded(child: SizedBox()),
                Button(
                  title: 'Enable Location',
                  onPressed: () {
                    _enableLocation(context);
                  },
                ),
                const Gap(16),
                BorderButton(
                  title: 'Skip for now',
                  onPressed: () {
                    // Go to home page
                  },
                ),
                const Gap(40),
              ],
            ),
          )
        ];
      },
    );
  }
}
