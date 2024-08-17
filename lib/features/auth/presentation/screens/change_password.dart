import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/domain/validation/validation.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/dialogs.dart';
import 'package:gaspay_mobile/core/presentation/widgets/input_field.dart';
import 'package:gaspay_mobile/core/presentation/widgets/pop_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/features/auth/presentation/manager/register_provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
        provider: RegisterProvider(),
        children: (provider, theme) {
          final state = provider.state;
          return [
            const Gap(10),
            PopWidget(
              callback: () {
                context.pop();
              },
            ),
            const Gap(32),
            Text(
              'Change password',
              style: theme.textTheme.titleLarge?.copyWith(fontSize: 20),
            ),
            const Gap(4),
            Text(
              'Set a strong password you can easily remember.',
              style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 16, color: theme.colorScheme.onSecondary),
            ),
            const Gap(32),
            InputField2(
              hint: 'Password',
              value: state.password,
              error: state.passwordError,
              isPassword: true,
              suffix: Visibility(
                visible: provider.isValidated(),
                child: const Icon(
                  Icons.check_rounded,
                  color: Color(0xFF06C270),
                  size: 16,
                ),
              ),
              onChange: (value) {
                provider.setPassword(value);
              },
            ),
            if (provider.isValidated()) ...[
              const Gap(8),
              Text(
                'Lovely!',
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13),
              ),
            ] else ...[
              const Gap(20),
              Text(
                'Use at least 8 character password is required',
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 13),
              ),
              const Gap(16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Container(
                    height: 34,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: state.password.isContainUppercase()
                          ? const Color(0xFF06C270)
                          : const Color(0xFFFAFAFE),
                    ),
                    child: Text(
                      'One upper case character',
                      style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                          color: state.password.isContainUppercase()
                              ? Colors.white
                              : theme.colorScheme.onSurface),
                    ),
                  ),
                  Container(
                    height: 34,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: state.password.isContainLowercase()
                          ? const Color(0xFF06C270)
                          : const Color(0xFFFAFAFE),
                    ),
                    child: Text(
                      'One lower case character',
                      style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                          color: state.password.isContainLowercase()
                              ? Colors.white
                              : theme.colorScheme.onSurface),
                    ),
                  ),
                  Container(
                    height: 34,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: state.password.isNumber()
                          ? const Color(0xFF06C270)
                          : const Color(0xFFFAFAFE),
                    ),
                    child: Text(
                      'One number',
                      style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                          color: state.password.isNumber()
                              ? Colors.white
                              : theme.colorScheme.onSurface),
                    ),
                  ),
                  Container(
                    height: 34,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: state.password.isSpecial()
                          ? const Color(0xFF06C270)
                          : const Color(0xFFFAFAFE),
                    ),
                    child: Text(
                      'One special number (! @ # \$ % ^ &)',
                      style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                          color: state.password.isSpecial()
                              ? Colors.white
                              : theme.colorScheme.onSurface),
                    ),
                  ),
                ],
              ),
            ],
            const Spacer(),
            const Gap(16),
            Button(
              title: 'Continue',
              isEnabled: provider.isValidated(),
              onPressed: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (ctx) => SucessDialog(
                    title: 'Password Changed!',
                    subtitle:
                        'You can now sign in to your account with your new password.',
                    buttonText: 'Continue!',
                    onFinish: () {
                      context.pop();
                    },
                  ),
                );
              },
            ),
            const Gap(32),
          ];
        });
  }
}
