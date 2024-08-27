import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/utils/custom_state.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/utils/snack_bar_utils.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:gaspay_mobile/features/auth/presentation/screens/register.dart';
import 'package:gaspay_mobile/features/onboarding/presentation/manager/splash_provider.dart';
import 'package:gaspay_mobile/features/onboarding/presentation/screens/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "/splash-screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends CustomState<SplashScreen> {
  SplashProvider? _provider;

  @override
  void onStarted() {
    _provider?.listen((event) {
      logg("$event");
      if (event == -1) {
        context.pushReplacement(const OnboardingScreen());
      } else if (event == 0) {
        context.pushReplacement(const RegisterScreen());
      } else {
        //To home
        // context.pushNamedAndClear(HomeScreen.id);
      }
    });
    super.onStarted();
  }

  @override
  Widget build(BuildContext context) {
    //NOTE: Instead of of doing this, refer to the [ProviderWidget]
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (_) => SplashProvider(),
      child: Consumer<SplashProvider>(
        builder: (_, provider, __) {
          _provider ??= provider;
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: SvgImage(
                    asset: icLogo,
                  ),
                ),
                const Gap(8),
                Text(
                  'GasPay',
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontSize: 32,
                    color: theme.colorScheme.primary,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
