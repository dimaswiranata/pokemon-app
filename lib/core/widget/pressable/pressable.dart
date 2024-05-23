import 'package:flutter/material.dart';

class Pressable extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final double activeOpacity;
  final int duration;

  const Pressable({
    required this.child,
    required this.onTap,
    this.activeOpacity = 0.5,
    this.duration = 100,
  });

  @override
  _PressableState createState() => _PressableState();
}

class _PressableState extends State<Pressable> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() {
        _isPressed = true;
      }),
      onTapUp: (_) => setState(() {
        _isPressed = false;
      }),
      onTapCancel: () => setState(() {
        _isPressed = false;
      }),
      onTap: widget.onTap,
      child: Builder(
        builder: (context) {
          return AnimatedOpacity(
            opacity: _isPressed ? widget.activeOpacity : 1.0,
            duration: Duration(milliseconds: widget.duration),
            child: widget.child,
          );
        },
      ),
    );
  }
}
