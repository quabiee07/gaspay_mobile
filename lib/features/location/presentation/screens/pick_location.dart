import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/utils/custom_state.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/utils/snack_bar_utils.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/clickable.dart';
import 'package:gaspay_mobile/core/presentation/widgets/input_field.dart';
import 'package:gaspay_mobile/core/presentation/widgets/pop_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:gaspay_mobile/features/location/presentation/manager/location_provider.dart';
import 'package:gaspay_mobile/features/location/presentation/screens/enable_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PickLocationScreen extends StatefulWidget {
  const PickLocationScreen({super.key});
  static const String id = '/pick-location';

  @override
  State<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends CustomState<PickLocationScreen> {
  LocationProvider? _provider;

  late GoogleMapController _mapController;
  LatLng? _pickedLocation;
  LocationData? _currentLocation;

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }

    _currentLocation = await location.getLocation();

    if (_currentLocation != null) {
      _mapController.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
          14,
        ),
      );
      setState(() {
        _pickedLocation = LatLng(
          _currentLocation!.latitude!,
          _currentLocation!.longitude!,
        );
      });
    }
  }

  void _onMapTap(LatLng location) {
    setState(() {
      _pickedLocation = location;
      _latitudeController.text = location.latitude.toString();
      _longitudeController.text = location.longitude.toString();
    });
  }

  void _submitLocation() {
    // Handle the submission of the form
    final address = _addressController.text;
    final title = _titleController.text;
    final latitude = _latitudeController.text;
    final longitude = _longitudeController.text;

    // Save or process the data
    print('Address: $address, Title: $title, Lat: $latitude, Long: $longitude');
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      provider: LocationProvider(),
      children: (provider, theme) {
        _provider ?? provider;
        return [
          const Gap(20),
          PopWidget(
            callback: () {
              context.pop();
            },
          ),
          const Gap(20),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _pickedLocation ?? LatLng(0, 0),
                zoom: 2,
              ),
              onMapCreated: (controller) => _mapController = controller,
              onTap: _onMapTap,
              markers: _pickedLocation != null
                  ? {
                      Marker(
                        markerId: MarkerId('selected-location'),
                        position: _pickedLocation!,
                      ),
                    }
                  : {},
            ),
          ),
                    const Gap(32),

            InputField2(
            hint: 'First name',
            onChange: (value) {},
          ),
          const Gap(16),
          InputField2(
            hint: 'Last name',
            onChange: (value) {},
          ),
          const Gap(16),
          InputField2(
            hint: 'Email address',
            onChange: (value) {},
          ),
          const Gap(16),
          InputField2(
            hint: 'Phone number',
            onChange: (value) {},
          ),
          const Gap(32),
          Button(
            title:'Submit',
            onPressed: (){}
          ),
          const Gap(32),
          
        ];
      },
    );
  }
}
