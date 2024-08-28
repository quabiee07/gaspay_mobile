import 'package:gaspay_mobile/core/di/core_module_container.dart';
import 'package:gaspay_mobile/core/domain/utils/constants.dart';
import 'package:gaspay_mobile/core/presentation/manager/custom_provider.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingProvider extends CustomProvider {
  final _pref = getIt.getAsync<SharedPreferences>();
  int page = 0;
  final imgs = [
    imgOnboard1,
    imgOnboard2,
  ];

  final title = [
    'Gas purchase made easy',
    'Get Gas Loans',
  ];  

  final subTitle = [
    'Find and buy gas from the app and get seamless service at your preferred filling station.',
    'With a perfect credit score you can qualify for gas loans.',
  ];

  

  setPage(int page) {
    this.page = page;
    notifyListeners();
  }

  bool isEnd() {
    return page == imgs.length - 1;
  }

  setOnboarding() {
    _pref.then((value) {
      value.setBool(onboardingKey, true);
    });
  }
}
