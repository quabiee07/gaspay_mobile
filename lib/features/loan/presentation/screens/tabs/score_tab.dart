import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/utils/custom_state.dart';
import 'package:gaspay_mobile/features/loan/presentation/widgets/score_painter.dart';

class ScoreTab extends StatefulWidget {
  const ScoreTab({
    super.key,
  });

  @override
  State<ScoreTab> createState() => _ScoreTabState();
}

class _ScoreTabState extends CustomState<ScoreTab>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scoreAnimation;
  int score = 11;

  @override
  void onStart() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _scoreAnimation =
        Tween<double>(begin: 0, end: score.toDouble()).animate(_controller);
    _controller.forward();
    super.onStart();
  }

  @override
  void onDestroy() {
    _controller.dispose();
    super.onDestroy();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Gap(24),
        Column(
          children: [
            Text(
              'Your Patronage Score is',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: 15,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Gap(8),
            AnimatedBuilder(
              animation: _scoreAnimation,
              builder: (context, child) {
                return Text(
                  '${_scoreAnimation.value.toInt()}',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 32,
                    color: theme.colorScheme.onSurface,
                  ),
                );
              },
            ),
          ],
        ),
        const Gap(60),
        SizedBox(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                size: const Size(350, 152),
                painter: ScorePainter(
                  score: score,
                  animationValue: _scoreAnimation.value,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
