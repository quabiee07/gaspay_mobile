import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    super.key,
    required this.children,
  });
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.dividerColor),
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            offset: const Offset(0, 1),
            color: const Color(0xFFEFEFEF).withOpacity(.64),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Gap(8),
        Divider(color: Color(0xFFF0F0F0)),
        Gap(8),
      ],
    );
  }
}
