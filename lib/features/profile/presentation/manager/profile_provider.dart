import 'package:gaspay_mobile/core/presentation/manager/custom_provider.dart';

class ProfileProvider extends CustomProvider {
  bool isCard = false;

  setTopUp(bool value) {
    isCard = value;
    notifyListeners();
  }
}
