import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/theme/colors/colors.dart';
import 'package:gaspay_mobile/core/presentation/widgets/reusable_back_button_with_title.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/presentation/resources/drawables.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  DateTime _today = DateTime.now();
  late CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: ReusableBackButtonWithTitle(
                isText: true,
                title: "Notification",
                onTap: () {
                  Navigator.pop(context);
                },
                isBackIconVisible: true,
                suffixWidget: const SizedBox(),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                bottom: 16,
                left: 10,
                right: 10,
              ),
              margin: const EdgeInsets.only(
                top: 33,
                bottom: 20,
              ),
              decoration:
                  BoxDecoration(color: theme.colorScheme.surface, boxShadow: [
                BoxShadow(
                    color: colorBlack.withOpacity(0.05),
                    offset: const Offset(1, 0),
                    blurRadius: 11)
              ]),
              child: Column(
                children: [
                  TableCalendar(
                    daysOfWeekHeight: 20,
                    locale: "en_US",
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: theme.textTheme.labelMedium!.copyWith(
                        fontSize: 12,
                        color: mediumGray2,
                      ),
                      weekendStyle: theme.textTheme.labelMedium!.copyWith(
                        fontSize: 12,
                        color: mediumGray2,
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      todayDecoration: const BoxDecoration(
                        color: calenderIndicatorBlue,
                        shape: BoxShape.circle,
                      ),
                      todayTextStyle: theme.textTheme.labelMedium!.copyWith(
                        fontSize: 16,
                        color: theme.colorScheme.surface,
                      ),
                      defaultTextStyle: theme.textTheme.labelMedium!.copyWith(
                        fontSize: 16,
                        color: theme.colorScheme.onSurface,
                      ),
                      weekendTextStyle: theme.textTheme.labelMedium!.copyWith(
                        fontSize: 16,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    calendarFormat: _calendarFormat,
                    availableGestures: AvailableGestures.all,
                    focusedDay: _today,
                    headerVisible: false,
                    firstDay: DateTime.utc(2024, 1, 1),
                    lastDay: DateTime.utc(2040, 1, 1),
                    enabledDayPredicate: (day) {
                      return isSameDay(_today, day);
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(_today, day);
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      setState(() {
                        _today = focusedDay;
                      });
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _today = focusedDay;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    DateFormat('EE MMMM d, yyyy').format(_today),
                    style: theme.textTheme.labelMedium!.copyWith(
                        fontSize: 16, color: theme.colorScheme.onSurface),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 16,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: dividerGray, // Top border color
                    width: 1, // Top border width
                  ),
                ),
                color: borderLightGray,
              ),
              child: Row(
                children: [
                  Text(
                    "Today",
                    style: theme.textTheme.labelSmall!.copyWith(
                      fontSize: 14,
                      color: darkBlueText,
                    ),
                  ),
                ],
              ),
            ),
            const ReusableNotificationContainer(
              title: 'You just added a new Bank Card',
              date: "9:30 Am",
              isNewNotification: true,
            ),
            const ReusableNotificationContainer(
              title: 'You just added a new Card',
              date: '9:30 Am',
              isNewNotification: false,
            )
          ],
        ),
      ),
    );
  }
}

class ReusableNotificationContainer extends StatelessWidget {
  const ReusableNotificationContainer({
    super.key,
    required this.title,
    required this.date,
    required this.isNewNotification,
  });

  final bool isNewNotification;
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 20, bottom: 20),
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: dividerGray, // Bottom border color
          width: 1, // Bottom border width
        ),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isNewNotification
              ? const SvgImage(asset: notificationIndicator)
              : const SizedBox.shrink(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SvgImage(asset: gasPayLogo),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.labelSmall!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: darkBlueText,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      date,
                      style: theme.textTheme.labelSmall!.copyWith(
                        fontSize: 12,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.w700,
                        color: gray1,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
