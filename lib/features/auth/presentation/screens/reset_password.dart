import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/utils/custom_state.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/dialogs.dart';
import 'package:gaspay_mobile/core/presentation/widgets/input_field.dart';
import 'package:gaspay_mobile/core/presentation/widgets/pop_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/features/auth/presentation/manager/login_provider.dart';
import 'package:gaspay_mobile/features/auth/presentation/screens/change_password.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String id = '/reset-password';
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends CustomState<ResetPasswordScreen> {
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
            'Reset password',
            style: theme.textTheme.titleLarge?.copyWith(fontSize: 20),
          ),
          const Gap(4),
          Text(
            'Enter your email address and we’ll send you a password reset link.',
            style: theme.textTheme.bodySmall
                ?.copyWith(fontSize: 16, color: theme.colorScheme.onSecondary),
          ),
          const Gap(32),
          InputField2(
            hint: 'Email address',
            inputType: TextInputType.emailAddress,
            onChange: (value) {},
          ),
          const Gap(32),
          Button(
            title: 'Continue',
            isEnabled: true,
            onPressed: () {
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
                    context.push(const ChangePasswordScreen());
                  },
                ),
              );
            },
          ),
          const Gap(16),
        ];
      },
    );
  }
}
