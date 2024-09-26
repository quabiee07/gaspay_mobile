import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/widgets/clickable.dart';
import 'package:gaspay_mobile/core/presentation/widgets/provider_widget.dart';
import 'package:gaspay_mobile/core/presentation/widgets/reusable_back_button_with_title.dart';
import 'package:gaspay_mobile/features/profile/presentation/manager/profile_provider.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  int? selectedIndex;
  bool isPromo = false;
  bool isTransaction = false;
  bool isReward = false;
  bool isLoan = false;
  bool isOther = false;

  List<String> titles = [
    'Promotion Alerts',
    'Transaction Alerts',
    'Reward Alerts',
    'Loan Alerts',
    'Other Alerts',
  ];
  late List<bool> notify = [];

  @override
  void initState() {
    notify = [
      isPromo,
      isTransaction,
      isReward,
      isLoan,
      isOther,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      padding: 16,
      provider: ProfileProvider(),
      children: (provider, theme) {
        return [
          const ReusableBackButtonWithTitle(
            isText: false,
            title: 'Promo Codes',
            isBackIconVisible: true,
          ),
          const Gap(32),
          Text(
            'My notifications',
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 15,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const Gap(4),
          Text(
            'Manage your notifications to help keep you on top of things.',
            style: theme.textTheme.titleSmall?.copyWith(
              fontSize: 13,
              color: theme.colorScheme.onSurface.withOpacity(.8),
            ),
          ),
          const Gap(32),
          Column(
            children: List.generate(titles.length, (index) {
              return Column(
                children: [
                  Clickable(
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            titles[index],
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          CupertinoSwitch(
                            activeColor: theme.colorScheme.primary,
                            value: notify[index],
                            onChanged: (value) {
                              setState(() {
                                notify[index] = value;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  if (titles[index] != 'Other Alerts') ...[
                    Divider(color: theme.dividerColor),
                  ]
                ],
              );
            }),
          ),
          const Gap(40),
          Row(
            children: [
              Text(
                'Reminder',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 15,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              Clickable(
                onPressed: () {},
                child: Text(
                  'Turn on all',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 15,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ];
      },
    );
  }
}
