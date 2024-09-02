import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/clickable.dart';
import 'package:gaspay_mobile/core/presentation/widgets/input_field.dart';
import 'package:gaspay_mobile/core/presentation/widgets/pop_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/features/auth/presentation/manager/login_provider.dart';
import 'package:gaspay_mobile/features/auth/presentation/screens/register.dart';
import 'package:gaspay_mobile/features/auth/presentation/screens/reset_password.dart';
import 'package:gaspay_mobile/features/bottom%20nav%20bar/presentation/screens/bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

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
            'Welcome back!',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(fontSize: 20),
          ),
          const Gap(4),
          Text(
            'Sign in to your GasPay account',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall
                ?.copyWith(fontSize: 16, color: theme.colorScheme.onSecondary),
          ),
          const Gap(32),
          InputField2(
            hint: 'Email address',
            onChange: (value) {},
          ),
          const Gap(16),
          InputField2(
            hint: 'Password',
            isPassword: true,
            onChange: (value) {},
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                      activeColor: theme.colorScheme.primary,
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      }),
                  Text(
                    "Remember me",
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15),
                  )
                ],
              ),
              Clickable(
                onPressed: () {
                  context.push(const ResetPasswordScreen());
                },
                child: Text(
                  "Forgot password?",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 15,
                    color: const Color(0xFFF46A2B),
                  ),
                ),
              )
            ],
          ),
          const Gap(32),
          Button(
            title: 'Continue',
            isEnabled: true,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const BottomNavBar(),
                ),
              );
            },
          ),
          const Gap(16),
          Center(
            child: RichText(
              text: TextSpan(
                text: "Don\'t have an account?",
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 13),
                children: [
                  const WidgetSpan(child: SizedBox(width: 5)),
                  TextSpan(
                    text: 'Sign up',
                    style: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 13, color: theme.colorScheme.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.push(const RegisterScreen());
                      },
                  )
                ],
              ),
            ),
          ),
        ];
      },
    );
  }
}
