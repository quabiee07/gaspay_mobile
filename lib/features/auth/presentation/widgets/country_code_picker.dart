// // import 'package:country_picker/country_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:gaspay_mobile/features/auth/presentation/manager/auth_state.dart';\

// class CountryCodePicker extends StatefulWidget {
//   const CountryCodePicker({
//     super.key,
//     required this.state,
//   });

//   final AuthState state;

//   @override
//   State<CountryCodePicker> createState() => _CountryCodePickerState();
// }

// class _CountryCodePickerState extends State<CountryCodePicker> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Align(
//       widthFactor: 1.0,
//       heightFactor: 1.0,
//       child: GestureDetector(
//         onTap: () {
//           showCountryPicker(
//               context: context,
//               onSelect: (country) {
//                 setState(() {
//                   widget.state.selectedCountry = "+${country.phoneCode}";
//                   widget.state.selectedCountryCode = country.countryCode;
//                 });
//               },
//               countryListTheme: CountryListThemeData(
//                 bottomSheetHeight: MediaQuery.of(context).size.height * .6,
//                 backgroundColor: theme.colorScheme.surface,
//                 // Optional. Sets the border radius for the bottomsheet.
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(10.0),
//                   topRight: Radius.circular(10.0),
//                 ),

//                 // Optional. Styles the search field.
//                 inputDecoration: InputDecoration(
//                   labelText: 'Search',
//                   hintText: 'Start typing to search',
//                   prefixIcon: const Icon(Icons.search),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: theme.primaryColor,
//                     ),
//                   ),
//                   focusColor: theme.primaryColor,
//                   prefixIconColor: theme.primaryColor,
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: const Color(0xFF8C98A8).withOpacity(0.2),
//                     ),
//                   ),
//                 ),
//                 textStyle: theme.textTheme.bodyMedium?.copyWith(
//                   fontSize: 16,
//                 ),
//                 // Optional. Styles the text in the search field
//                 searchTextStyle: theme.textTheme.bodyMedium
//                     ?.copyWith(fontSize: 16, color: textGreyLight),
//               ));
//         },
//         child: Padding(
//           padding: const EdgeInsets.only(left: 10, right: 10),
//           child: Text(
//             widget.state.selectedCountry ??
//                 "${widget.state.countryPicker.flagEmoji} +${widget.state.countryPicker.phoneCode}",
//             textAlign: TextAlign.start,
//             style: theme.textTheme.bodyMedium?.copyWith(
//               fontSize: 14,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
