import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nexus_app/core/index.dart';

class AntiCircularTimer extends StatefulWidget {
  final double circleSize;
  final void Function()? onTimerCompleted;
  final int second;
  final Color? backgroundColor;
  final LinearGradient? gradient;
  final bool showScaleEffect;
  final bool isRefeatTimer;

  const AntiCircularTimer({
    Key? key,
    required this.circleSize,
    required this.onTimerCompleted,
    required this.second,
    this.backgroundColor,
    this.gradient,
    this.showScaleEffect = false,
    this.isRefeatTimer = false,
  }) : super(key: key);

  @override
  _AntiCircularTimerState createState() => _AntiCircularTimerState();
}

class _AntiCircularTimerState extends State<AntiCircularTimer> with TickerProviderStateMixin {
  late AnimationController heartbeatController;
  late Animation<double> heartbeatAnimation;
  late AnimationController timerController;

  @override
  void initState() {
    super.initState();
    heartbeatController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    heartbeatAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: heartbeatController,
        curve: Curves.easeInOut,
      ),
    );
    heartbeatController.repeat(reverse: true);
    timerController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.second),
    );

    if (widget.isRefeatTimer) {
      timerController.repeat();
    } else {
      timerController.forward();
      timerController.addListener(() => _listenTimer());
    }
  }

  void _listenTimer() {
    if (timerController.isCompleted && (widget.onTimerCompleted != null)) {
      widget.onTimerCompleted!();
    }
  }

  @override
  void dispose() {
    heartbeatController.dispose();
    timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColors = widget.backgroundColor ?? Colors.transparent;
    final gradientColors = widget.gradient ??
        LinearGradient(
          begin: Alignment(0.94, 0.33),
          end: Alignment(-0.94, -0.33),
          colors: [secondaryGold, primaryColor],
        );

    return AnimatedBuilder(
      animation: timerController,
      builder: (context, child) {
        Widget content = SizedBox(
          width: widget.circleSize,
          height: widget.circleSize,
          child: CustomPaint(
            painter: CustomTimerPainter(
              animation: timerController,
              backgroundColor: backgroundColors,
              gradient: gradientColors,
              circleSize: widget.circleSize,
            ),
          ),
        );

        if (widget.showScaleEffect) {
          content = ScaleTransition(
            scale: heartbeatAnimation,
            child: content,
          );
        }

        return content;
      },
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    required this.animation,
    required this.backgroundColor,
    required this.gradient,
    required this.circleSize,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor;
  final LinearGradient gradient;
  final double circleSize;

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    Paint gradientPaint = Paint()
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, backgroundPaint);

    if (gradient.colors.isNotEmpty) {
      Rect rect = Offset.zero & size;
      gradientPaint.shader = gradient.createShader(rect);
      double progress = (1.0 - animation.value) * 2 * pi;
      canvas.drawArc(rect, pi * 1.5, -progress, false, gradientPaint);
    }
  }

  @override
  bool shouldRepaint(CustomTimerPainter oldDelegate) {
    return animation.value != oldDelegate.animation.value ||
        backgroundColor != oldDelegate.backgroundColor ||
        gradient != oldDelegate.gradient;
  }
}
