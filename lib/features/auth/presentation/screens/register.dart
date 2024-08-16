import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/input_field.dart';
import 'package:gaspay_mobile/core/presentation/widgets/pop_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/features/auth/presentation/manager/register_provider.dart';
import 'package:gaspay_mobile/features/auth/presentation/screens/login.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int page = 0;
  final title = [
    'Create your free account today!',
    'Set your password',
  ];
  final subtitle = [
    'Please fill in your personal information',
    'Set a password you can remember',
  ];

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      padding: 16,
      provider: RegisterProvider(),
      children: (provider, theme) {
        return [
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PopWidget(
                callback: () {
                  context.pop();
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Container(
                        width: 35,
                        height: 4,
                        decoration: BoxDecoration(
                          color: index == page
                              ? theme.colorScheme.primary
                              : theme.colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Visibility(
                visible: false,
                maintainSize: true,
                maintainAnimation: true,
                maintainInteractivity: true,
                maintainSemantics: true,
                maintainState: true,
                child: PopWidget(
                  callback: () {
                    context.pop();
                  },
                ),
              ),
            ],
          ),
          const Gap(32),
          Text(
            title[page],
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(fontSize: 20),
          ),
          const Gap(4),
          Text(
            subtitle[page],
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall
                ?.copyWith(fontSize: 16, color: theme.colorScheme.onSecondary),
          ),
          const Gap(32),
          Expanded(
            child: PageView(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  page = value;
                });
              },
              children: const [
                PersonalInfo(),
                SetPassword(),
              ],
            ),
          )
        ];
      },
    );
  }
}

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          InputField2(
            hint: 'First name',
            onChange: (value) {},
          ),
          const Gap(16),
          InputField2(
            hint: 'Last name',
            onChange: (value) {},
          ),
          const Gap(16),
          InputField2(
            hint: 'Email address',
            onChange: (value) {},
          ),
          const Gap(16),
          InputField2(
            hint: 'Phone number',
            onChange: (value) {},
          ),
          const Gap(80),
          Button(
            title: 'Continue',
            isEnabled: false,
            onPressed: () {},
          ),
          const Gap(16),
          RichText(
            text: TextSpan(
              text: "Already have an account?",
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 13),
              children: [
                const WidgetSpan(child: SizedBox(width: 5)),
                TextSpan(
                  text: 'Sign in',
                  style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 13, color: theme.colorScheme.primary),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.push(const LoginScreen());
                    },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  bool hasAgreed = false;
  final validationText = [
    'One lower case character',
    'One upper case character',
    'One number',
    'One special number (! @ # \$ % ^ &)',
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputField2(
          hint: 'Password',
          isPassword: true,
          onChange: (value) {},
        ),
        const Gap(20),
        Text(
          'Use at least 8 character password is required',
          style: theme.textTheme.bodySmall?.copyWith(fontSize: 13),
        ),
        const Gap(16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(4, (index) {
            return Container(
              height: 34,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFFFAFAFE),
              ),
              child: Text(
                validationText[index],
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
              ),
            );
          }),
        ),
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
                      style: theme.textTheme.bodySmall?.copyWith(fontSize: 13),
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
          isEnabled: hasAgreed,
          onPressed: () {},
        ),
        const Gap(32),
      ],
    );
  }
}
