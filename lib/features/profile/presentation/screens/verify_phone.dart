import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/utils/snack_bar_utils.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/input_field.dart';
import 'package:gaspay_mobile/core/presentation/widgets/overlay_loader.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/reusable_back_button_with_title.dart';
import 'package:gaspay_mobile/features/profile/presentation/manager/profile_provider.dart';

class VerifyPhoneScreen extends StatelessWidget {
  const VerifyPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final overlay = LoadingOverlay.of(context);

    return ProviderWidget(
      padding: 16,
      provider: ProfileProvider(),
      children: (provider, theme) {
        return [
          const ReusableBackButtonWithTitle(
            isText: false,
            title: 'Account Details',
            isBackIconVisible: true,
          ),
          const Gap(32),
          Text(
            'Verify your Phone Number',
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 15,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const Gap(4),
          Text(
            'We will send you a text containing a code to verify your phone number.',
            style: theme.textTheme.titleSmall?.copyWith(
              fontSize: 13,
              color: theme.colorScheme.onSurface.withOpacity(.8),
            ),
          ),
          const Gap(32),
          InputField2(
            hint: 'Phone Number',
            onChange: (value) {},
          ),
          const Spacer(),
          Button(
            title: 'Next',
            isEnabled: true,
            onPressed: () async {
              await overlay
                  .showAndHideLoader(Future.delayed(const Duration(seconds: 3)))
                  .then((value) {
                context.showSuccess('Phone Number Changed');
              });
            },
          ),
          const Gap(100),
        ];
      },
    );
  }
}
