import 'package:gaspay_mobile/core/di/core_module_container.dart';
import 'package:gaspay_mobile/core/presentation/manager/custom_provider.dart';
import 'package:location/location.dart';

class LocationProvider extends CustomProvider {
  final location = Location();
  final _loacation = getIt.getAsync<Location>();

  LocationProvider() {
    Future.delayed(const Duration(seconds: 0), () {
      _loacation.then((value) {
        final permission = value.hasPermission();
        permission.then((value) {
          if (value == PermissionStatus.denied) {
            add(0);
            return;
          } else if (value == PermissionStatus.granted) {
            add(1);
            return;
          }
          notifyListeners();
        });
      });
    });
  }
}
