import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaspay_mobile/core/presentation/manager/theme_provider.dart';
import 'package:gaspay_mobile/core/presentation/theme/app_theme.dart';
import 'package:gaspay_mobile/core/presentation/utils/custom_state.dart';
import 'package:gaspay_mobile/features/auth/presentation/screens/login.dart';
import 'package:gaspay_mobile/features/auth/presentation/screens/register.dart';
import 'package:gaspay_mobile/features/auth/presentation/screens/reset_password.dart';
import 'package:gaspay_mobile/features/onboarding/presentation/screens/onboarding.dart';
import 'package:gaspay_mobile/features/onboarding/presentation/screens/splash.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget with AppTheme {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (_, provider, __) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  provider.isDark ? Brightness.light : Brightness.dark));
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: provider.isDark
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Gaspay Mobile',
              theme: provider.theme,
              darkTheme: provider.darkThemeData,
              navigatorKey: navigator,
              navigatorObservers: [routeObserver],
              home: const SplashScreen(),
              initialRoute: SplashScreen.id,
              routes: {
                SplashScreen.id: (context) => const SplashScreen(),
                OnboardingScreen.id: (context) => const OnboardingScreen(),
                RegisterScreen.id: (context) => const RegisterScreen(),
                LoginScreen.id: (context) => const LoginScreen(),
                ResetPasswordScreen.id: (context) =>
                    const ResetPasswordScreen(),
              },
            ),
          );
        },
      ),
    );
  }
}
