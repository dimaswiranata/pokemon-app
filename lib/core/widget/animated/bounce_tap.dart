import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AntiBounceTap extends StatefulWidget {
  final Function? onTap;
  final Widget? icon;

  const AntiBounceTap({this.onTap, this.icon});

  @override
  _AntiBounceTapState createState() => _AntiBounceTapState();
}

class _AntiBounceTapState extends State<AntiBounceTap> with SingleTickerProviderStateMixin {
  late AnimationController _bounceCont;
  late Animation<double> _bounceTween;

  @override
  void initState() {
    super.initState();
    _bounceCont = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _bounceTween = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _bounceCont,
        curve: Curves.bounceOut,
      ),
    );
    _bounceCont.forward();
  }

  @override
  void dispose() {
    _bounceCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        _bounceCont.reset();
        _bounceCont.forward();
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: ScaleTransition(
        scale: _bounceTween,
        child: widget.icon,
      ),
    );
  }
}
