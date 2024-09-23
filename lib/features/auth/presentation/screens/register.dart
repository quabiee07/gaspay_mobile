import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/pop_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/features/auth/presentation/manager/register_provider.dart';
import 'package:gaspay_mobile/features/auth/presentation/screens/pages/personal_info.dart';
import 'package:gaspay_mobile/features/auth/presentation/screens/pages/set_password.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterProvider? _provider;

  @override
  Widget build(BuildContext context) {
    final type = context.getArgs<String>();
    return ProviderWidget(
      padding: 16,
      provider: RegisterProvider(),
      children: (provider, theme) {
        _provider ??= provider;
        // final state = provider.state;
        return [
          const Gap(10),
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
                  provider.title.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Container(
                        width: 35,
                        height: 4,
                        decoration: BoxDecoration(
                          color: index == provider.page
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
            provider.title[provider.page],
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(fontSize: 20),
          ),
          const Gap(4),
          Text(
            provider.subtitle[provider.page],
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall
                ?.copyWith(fontSize: 16, color: theme.colorScheme.onSecondary),
          ),
          const Gap(32),
          Expanded(
            child: PageView(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) {
                provider.setPage(value);
              },
              children: [
                PersonalInfo(
                  isCompany: type.contains('company'),
                ),
                const SetPassword(),
              ],
            ),
          )
        ];
      },
    );
  }
}
