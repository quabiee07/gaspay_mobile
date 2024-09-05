import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/utils/custom_state.dart';

class CustomTabWidget extends StatefulWidget {
  const CustomTabWidget({
    super.key,
    required this.tabTitles,
    required this.children,
  });
  final List<String> tabTitles;
  final List<Widget> children;

  @override
  State<CustomTabWidget> createState() => _CustomTabWidgetState();
}

class _CustomTabWidgetState extends CustomState<CustomTabWidget>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController _tabController;

  @override
  void onStart() {
    _tabController =
        TabController(length: widget.tabTitles.length, vsync: this);
    _tabController.addListener(() {
      if (!mounted) {
        return;
      }
      setState(() {
        selectedIndex = _tabController.index;
      });
    });

    super.onStart();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            isScrollable: true,
            controller: _tabController,
            labelStyle: theme.textTheme.bodyMedium?.copyWith(fontSize: 11),
            labelColor: theme.colorScheme.surface,
            unselectedLabelColor: const Color(0xFF002933).withOpacity(.5),
            labelPadding: const EdgeInsets.only(right: 8),
            tabAlignment: TabAlignment.center,
            dividerColor: Colors.transparent,
     
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const BoxDecoration(),
            splashBorderRadius: BorderRadius.circular(8),
            splashFactory: NoSplash.splashFactory,
            dragStartBehavior: DragStartBehavior.down,
            tabs: List.generate(widget.tabTitles.length, (index) {
              final item = widget.tabTitles.elementAt(index);
              return Tab(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: selectedIndex == index
                        ? theme.colorScheme.primary
                        : const Color(0xFFEDECEC),
                  ),
                  child: Center(
                    child: Text(
                      item,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: selectedIndex == index
                            ? theme.colorScheme.surface
                            : const Color(0xFF002933).withOpacity(.5),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const Gap(8),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: _tabController,
              children: widget.children,
            ),
          )
        ],
      ),
    );
  }
}
