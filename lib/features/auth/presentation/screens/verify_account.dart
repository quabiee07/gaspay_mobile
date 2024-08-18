import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/utils/custom_state.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/pop_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/features/auth/presentation/manager/login_provider.dart';
import 'package:gaspay_mobile/features/auth/presentation/screens/set_pin.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class VerifyAccountScreen extends StatefulWidget {
  static const String id = '/verify-account';
  const VerifyAccountScreen({super.key});

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends CustomState<VerifyAccountScreen> {
  bool rememberMe = false;
  int _countdown = 59;
  Timer? _timer;
  final otpFieldController = OtpFieldController();

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _stopTimer();
        }
      });
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  @override
  void onStart() {
    _startTimer();
    super.onStart();
  }

  @override
  void onDestroy() {
    _stopTimer();
    super.onDestroy();
  }

  @override
  Widget build(BuildContext context) {
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
            'Verify your email address',
            style: theme.textTheme.titleLarge?.copyWith(fontSize: 20),
          ),
          const Gap(4),
          Text(
            'We just sent a 6-digit code to brightuwaoma08@gmail.com',
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
            title: 'Verify Email',
            isEnabled: true,
            onPressed: () {
              context.push(const SetPinScreen());
            },
          ),
          const Gap(16),
          Center(
            child: RichText(
              text: TextSpan(
                text: "Didn’t receive code? ",
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 13),
                children: [
                  const WidgetSpan(child: SizedBox(width: 5)),
                  TextSpan(
                    text: 'Resend',
                    style: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 13, color: theme.colorScheme.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // context.push(const RegisterScreen());
                      },
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          if (_countdown > 0)
            Center(
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    text: 'Try again in ',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(color: theme.colorScheme.onPrimary),
                    children: [
                      TextSpan(
                          text: "${_countdown}s",
                          style: theme.textTheme.titleLarge?.copyWith(
                              color: theme.colorScheme.error, fontSize: 16)),
                    ]),
              ),
            ),
          const Gap(16),
        ];
      },
    );
  }
}
