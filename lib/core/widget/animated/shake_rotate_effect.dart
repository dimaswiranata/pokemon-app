import 'package:flutter/material.dart';

class ShakeRotateEffect extends StatefulWidget {
  const ShakeRotateEffect({
    super.key,
    required this.child,
    required this.animation,
    this.begin = 0,
    this.end = 0.01,
  });

  final Widget child;
  final Animation<double> animation;
  final double begin;
  final double end;

  @override
  State<ShakeRotateEffect> createState() => _ShakeRotateEffectState();
}

class _ShakeRotateEffectState extends State<ShakeRotateEffect> {
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animation = Tween<double>(
      begin: widget.begin,
      end: widget.end,
    ).animate(
      CurvedAnimation(
        parent: widget.animation,
        curve: Curves.easeOut,
        reverseCurve: Curves.bounceIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: widget.child,
    );
  }
}
