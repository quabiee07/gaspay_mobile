import 'package:gaspay_mobile/core/domain/validation/validation.dart';
import 'package:gaspay_mobile/core/presentation/manager/custom_provider.dart';
import 'package:gaspay_mobile/features/auth/presentation/manager/auth_state.dart';

class RegisterProvider extends CustomProvider {
  var state = AuthState();  
  RegisterProvider();

  int page = 0;
  final title = [
    'Create your free account today!',
    'Set your password',
  ];
  final subtitle = [
    'Please fill in your personal information',
    'Set a password you can remember',
  ];

  setPage(int value) {
    page = value;
    notifyListeners();
  }

  setPassword(String value) {
    state.password = value;
    state.passwordError = value.validatePassword();
    notifyListeners();
  }

  bool isValidated() {
    return state.isPasswordValidated = state.password.isContainUppercase() &&
        state.password.isContainLowercase() &&
        state.password.isNumber() &&
        state.password.isSpecial() &&
        state.password.trim().length >= 8;
  }

  setAccountType(String value) {
    state.accountType = value;
    notifyListeners();
  }
}
