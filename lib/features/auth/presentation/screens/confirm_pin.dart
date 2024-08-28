import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/utils/custom_state.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/dialogs.dart';
import 'package:gaspay_mobile/core/presentation/widgets/overlay_loader.dart';
import 'package:gaspay_mobile/core/presentation/widgets/pop_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/features/auth/presentation/manager/login_provider.dart';
import 'package:gaspay_mobile/features/location/presentation/screens/enable_location.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class ConfirmPinScreen extends StatefulWidget {
  static const String id = '/confirm-pin';
  const ConfirmPinScreen({super.key});

  @override
  State<ConfirmPinScreen> createState() => _ConfirmPinScreenState();
}

class _ConfirmPinScreenState extends CustomState<ConfirmPinScreen> {
  final otpFieldController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    final overlay = LoadingOverlay.of(context);
    return ProviderWidget(
      provider: LoginProvider(),
      children: (provider, theme) {
        return [
          const Gap(10),
          PopWidget(
            callback: () {
              context.pop();
            },
          ),
          const Gap(32),
          Text(
            'Confirm transaction pin',
            style: theme.textTheme.titleLarge?.copyWith(fontSize: 20),
          ),
          const Gap(4),
          Text(
            'Choose your preferred 4-digit pin to confirm transactions.',
            style: theme.textTheme.bodySmall
                ?.copyWith(fontSize: 16, color: theme.colorScheme.onSecondary),
          ),
          const Gap(32),
          Center(
            child: OTPTextField(
              controller: otpFieldController,
              length: 4,
              width: 210,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 44,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 10,
              obscureText: true,
              onChanged: (value) {},
              onCompleted: (value) {
                // provider.setOtp(value);
                // provider.verifyOtp(email: email);
              },
              otpFieldStyle: OtpFieldStyle(
                borderColor: theme.colorScheme.onSurface,
                enabledBorderColor: theme.colorScheme.secondary,
                backgroundColor: const Color(0xFFEFEFF1),
                focusBorderColor: theme.colorScheme.onSurface,
              ),
              keyboardType: TextInputType.number,
              style: theme.textTheme.titleLarge!.copyWith(fontSize: 20),
              inputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(1)
              ],
            ),
          ),
          const Gap(32),
          Button(
            title: 'Next',
            isEnabled: true,
            onPressed: () async {
              await overlay
                  .showAndHideLoader(Future.delayed(const Duration(seconds: 3)))
                  .then((value) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (ctx) => SucessDialog(
                    title: 'Instructions sent',
                    subtitle:
                        'We sent instructions to reset your password to brightuwaoma08@gmail.com please check both your inbox and spam.',
                    buttonText: 'Okay!',
                    onFinish: () {
                      context.pop();
                      context.push(const EnableLocationScreen());
                    },
                  ),
                );
              });
            },
          ),
          const Gap(16),
        ];
      },
    );
  }
}
