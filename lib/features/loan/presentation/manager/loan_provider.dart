import 'dart:developer';

import 'package:gaspay_mobile/core/di/core_module_container.dart';
import 'package:gaspay_mobile/core/domain/utils/constants.dart';
import 'package:gaspay_mobile/core/presentation/manager/custom_provider.dart';
import 'package:gaspay_mobile/features/loan/presentation/manager/loan_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoanProvider extends CustomProvider {
  final _pref = getIt.getAsync<SharedPreferences>();
  var state = LoanState();
  LoanProvider();

  bool isFirst() {
    return state.isFirstTime == true;
  }

  void toggleIsFirst() {
    state.isFirstTime = false;
    setLoanOnboarding();
  }

  setLoanOnboarding() {
    _pref.then((value) {
      value.setBool(loanOnboardingKey, state.isFirstTime);
    });
    notifyListeners();
  }

  Future<bool> _checkIsFirst() async {
    final pref = await _pref;
    return pref.getBool(loanOnboardingKey) ?? state.isFirstTime;
  }

  Future<void> checkLoanStatus() async {
    state.isFirstTime = await _checkIsFirst();
    log('${state.isFirstTime}');
    notifyListeners();
  }
}
