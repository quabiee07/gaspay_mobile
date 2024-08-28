import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/utils/navigation_mixin.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:gaspay_mobile/features/auth/presentation/manager/register_provider.dart';
import 'package:gaspay_mobile/features/auth/presentation/screens/register.dart';
import 'package:gaspay_mobile/features/auth/presentation/widgets/account_type_card.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';

class AccountTypeScreen extends StatefulWidget {
  const AccountTypeScreen({super.key});

  static const String id = "/account-type-screen";

  @override
  State<AccountTypeScreen> createState() => _AccountTypeScreenState();
}

class _AccountTypeScreenState extends State<AccountTypeScreen> {
  RegisterProvider? _provider;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (_) => RegisterProvider(),
      child: Consumer<RegisterProvider>(
        builder: (_, provider, __) {
          _provider ??= provider;
          final state = provider.state;
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Gap(67),
                    Text(
                      'Select Category',
                      style: theme.textTheme.displayLarge?.copyWith(
                        fontSize: 15,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const Gap(20),
                    AccountTypeCard(
                      title: 'Individual',
                      isSelected: state.accountType,
                      onTap: provider.setAccountType,
                    ),
                    const Gap(8),
                    AccountTypeCard(
                      title: 'Company',
                      isSelected: state.accountType,
                      onTap: provider.setAccountType,
                    ),
                    const Gap(91),
                    Button(
                      title: 'Proceed',
                      isEnabled: state.accountType != null,
                      onPressed: () {
                        context.pushNamed( RegisterScreen.id, args: state.accountType);
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
