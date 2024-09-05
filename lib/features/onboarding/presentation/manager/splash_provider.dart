import 'package:gaspay_mobile/core/di/core_module_container.dart';
import 'package:gaspay_mobile/core/domain/utils/constants.dart';
import 'package:gaspay_mobile/core/presentation/manager/custom_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider extends CustomProvider {
  final _pref = getIt.getAsync<SharedPreferences>();
  SplashProvider() {
    _pref.then((value) {
      Future.delayed(const Duration(seconds: 5), () {
        _pref.then((value) {
          if (value.getBool(onboardingKey) == null) {
            add(-1);
            return;
          }
          final token = value.getString(tokenKey);
          final loggedInUser = value.getString(user);
          accessToken = 'Bearer $token';
          if ((token == null && loggedInUser == null) ||
              (token != null && loggedInUser == null)) {
            add(0);
            return;
          }

          if (token != null && loggedInUser != null) {
            add(1);
            return;
          }
        });
      });
    });
  }
}
