import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/custom_image.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:gaspay_mobile/features/auth/presentation/screens/login.dart';
import 'package:gaspay_mobile/features/auth/presentation/screens/register.dart';
import 'package:gaspay_mobile/features/onboarding/presentation/manager/onboarding_provider.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String id = "/onboarding-screen";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (_) => OnboardingProvider(),
      child: Consumer<OnboardingProvider>(
        builder: (_, provider, __) {
          final title = provider.title[provider.page];
          final subtitle = provider.subTitle[provider.page];
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SvgImage(
                          asset: icLogo,
                          height: 27,
                        ),
                        const Gap(8),
                        Text(
                          'GasPay',
                          style: theme.textTheme.displayLarge?.copyWith(
                            fontSize: 20,
                            color: theme.colorScheme.primary,
                          ),
                        )
                      ],
                    ),
                    const Gap(55),
                    SizedBox(
                      height: 215,
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: provider.imgs.length,
                        onPageChanged: (value) {
                          provider.setPage(value);
                        },
                        itemBuilder: (context, index) {
                          return Center(
                              child: CustomImage(asset: provider.imgs[index]));
                        },
                      ),
                    ),
                    const Gap(44),
                    Text(title,
                        textAlign: TextAlign.center,
                        style:
                            theme.textTheme.titleLarge?.copyWith(fontSize: 24)),
                    const Gap(8),
                    Text(subtitle,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 16,
                            color: theme.colorScheme.onSecondary)),
                    const Gap(32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(provider.imgs.length, (index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 6),
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            color: index == provider.page
                                ? theme.colorScheme.primary
                                : theme.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(150),
                          ),
                        );
                      }),
                    ),
                    const Gap(40),
                    Button(
                      title: 'Sign Up',
                      onPressed: () {
                        if (provider.isEnd()) {
                          provider.setOnboarding();
                          context.push(const RegisterScreen());
                        } else {
                          _controller.animateToPage(
                            provider.page + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInExpo,
                          );
                        }
                      },
                    ),
                    const Gap(16),
                    BorderButton(
                      title: 'I already have an account',
                      onPressed: () {
                        context.push(const LoginScreen());
                      },
                    ),
                    const Gap(36),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
