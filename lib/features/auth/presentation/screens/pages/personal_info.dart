import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/input_field.dart';
import 'package:gaspay_mobile/features/auth/presentation/screens/login.dart';

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
