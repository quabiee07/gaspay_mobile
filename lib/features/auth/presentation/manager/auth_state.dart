// import 'package:country_picker/country_picker.dart';

class AuthState {
  bool isBasic = false;
  bool isPasswordValidated = false;
  // final countryPicker = Country.parse('ng');
  var selectedCountry;
  var selectedCountryCode;
  String password = '';
  String? passwordError;
  String firstName = '';
  String? firstNameError;
  String lastName = '';
  String? lastNameError;
  String email = '';
  String? emailError;
  String phone = '';
  String? phoneError;

  String? accountType;
}
