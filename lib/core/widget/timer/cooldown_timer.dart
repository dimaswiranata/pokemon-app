import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nexus_app/core/index.dart';

class AntiCooldownTimer extends StatefulWidget {
  final Duration countdownDuration;
  final VoidCallback? onCountdownComplete;
  final TextStyle? textStyle;

  const AntiCooldownTimer({
    Key? key,
    required this.countdownDuration,
    this.onCountdownComplete,
    this.textStyle,
  }) : super(key: key);

  @override
  _AntiCooldownTimerState createState() => _AntiCooldownTimerState();
}

class _AntiCooldownTimerState extends State<AntiCooldownTimer> {
  late Timer _timer;
  late Duration _currentDuration;

  @override
  void initState() {
    super.initState();
    _currentDuration = widget.countdownDuration;
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatDuration(_currentDuration),
      style: widget.textStyle ??
          bodyBody.copyWith(
            color: primaryWhite,
            fontWeight: FontWeight.w700,
          ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (_currentDuration.inSeconds > 0) {
          _currentDuration -= Duration(seconds: 1);
        } else {
          _timer.cancel();
          if (widget.onCountdownComplete != null) {
            widget.onCountdownComplete!();
          }
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
