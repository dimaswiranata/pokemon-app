import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nexus_app/core/index.dart';

class AntiResendTimer extends StatefulWidget {
  const AntiResendTimer({super.key, this.onResend, this.loading = false, this.second = 60});
  final void Function()? onResend;
  final bool loading;
  final int second;

  @override
  State<AntiResendTimer> createState() => _AntiResendTimerState();
}

class _AntiResendTimerState extends State<AntiResendTimer> {
  int _seconds = 60;
  Timer? _timer;
  bool _showTimer = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _seconds = widget.second;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _showTimer = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds--;
      });
      if (_seconds < 1) {
        _timer?.cancel();
        setState(() {
          _showTimer = false;
          _seconds = widget.second;
        });
      }
    });
  }

  Widget _buildTimerCount() {
    String count = '00:${_seconds}';
    if (_seconds < 10) {
      count = '00:0${_seconds}';
    }
    return Text(
      count,
      style: bodyBodySm.copyWith(
        color: primaryColor,
        fontWeight: FontWeight.w400,
        height: 1.50,
      ),
    );
  }

  Widget _buildTimer() {
    if (widget.loading) {
      return AntiLoading();
    }
    if (_showTimer) {
      return AntiContainer(
        mainAxis: MainAxisAlignment.center,
        crossAxis: CrossAxisAlignment.center,
        flexDir: FlexDirection.ROW,
        children: [
          AntiLoading(),
          SizedBox(
            width: space.md,
          ),
          Text(
            'Resend Code ',
            style: bodyBodySm.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.w300,
              height: 1.50,
            ),
          ),
          _buildTimerCount(),
        ],
      );
    }
    return GestureDetector(
      onTap: () {
        if (widget.onResend != null) {
          widget.onResend!();
        }
        _startTimer();
      },
      child: AntiContainer(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          'Resend Code'.toUpperCase(),
          style: bodyBodySm.copyWith(
            color: secondaryGold,
            fontWeight: FontWeight.w500,
            height: 1.50,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTimer();
  }
}
