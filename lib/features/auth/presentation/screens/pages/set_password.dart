import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/domain/validation/validation.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/input_field.dart';
import 'package:gaspay_mobile/features/auth/presentation/manager/register_provider.dart';
import 'package:gaspay_mobile/features/auth/presentation/screens/verify_Account.dart';
import 'package:provider/provider.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  bool hasAgreed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<RegisterProvider>(builder: (_, provider, __) {
      final state = provider.state;
      
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
          Row(
            children: [
              Checkbox(
                  activeColor: theme.colorScheme.primary,
                  value: hasAgreed,
                  onChanged: (value) {
                    setState(() {
                      hasAgreed = value!;
                    });
                  }),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account?",
                    style: theme.textTheme.bodySmall?.copyWith(fontSize: 13),
                    children: [
                      const WidgetSpan(child: SizedBox(width: 5)),
                      TextSpan(
                        text: 'Terms & Conditions ',
                        style: theme.textTheme.bodyLarge?.copyWith(
                            fontSize: 13, color: theme.colorScheme.primary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // context.push(const LoginScreen());
                          },
                      ),
                      TextSpan(
                        text: 'and',
                        style:
                            theme.textTheme.bodySmall?.copyWith(fontSize: 13),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                        text: ' Privacy Policy',
                        style: theme.textTheme.bodyLarge?.copyWith(
                            fontSize: 13, color: theme.colorScheme.primary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // context.push(const LoginScreen());
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Gap(16),
          Button(
            title: 'Continue',
            // isEnabled: hasAgreed && provider.isValidated(),
            onPressed: () {
              context.push(const VerifyAccountScreen());
            },
          ),
          const Gap(32),
        ],
      );
    });
  }
}
