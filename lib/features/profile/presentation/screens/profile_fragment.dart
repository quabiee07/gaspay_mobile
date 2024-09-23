import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/features/profile/presentation/manager/profile_provider.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({super.key});

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      provider: ProfileProvider(),
      children: (provider, theme) {
        return [];
      },
    );
  }
}
