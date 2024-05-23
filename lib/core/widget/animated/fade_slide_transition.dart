import 'package:flutter/material.dart';
import 'package:nexus_app/core/index.dart';

class AntiFadeSlideTransition extends StatelessWidget {
  const AntiFadeSlideTransition(
      {super.key,
      required this.animation,
      required this.child,
      this.type = OpacityType.FADE_IN,
      this.isSelected,
      this.milliseconds,
      this.curves});

  final Animation<double> animation;
  final Widget child;
  final OpacityType? type;
  final bool? isSelected;
  final int? milliseconds;
  final Curve? curves;

  @override
  Widget build(BuildContext context) {
    return AntiSlideTransition(
      animation: animation,
      child: AntiAnimatedOpacity(
        child: child,
        type: type,
        isSelected: isSelected,
        milliseconds: milliseconds,
        curves: curves,
      ),
    );
  }
}

class FadeSlideAnimation extends StatefulWidget {
  const FadeSlideAnimation({super.key, required this.child, this.millisecond, this.delay});
  final Widget child;
  final int? millisecond;
  final int? delay;

  @override
  State<FadeSlideAnimation> createState() => _FadeSlideAnimationState();
}

class _FadeSlideAnimationState extends State<FadeSlideAnimation> with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _opacityController;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _doubleAnimation;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _opacityController.dispose();
    super.dispose();
  }

  void _init() async {
    _slideController = AnimationController(vsync: this, duration: Duration(milliseconds: widget.millisecond ?? 500));
    _opacityController =
        AnimationController(vsync: this, duration: Duration(milliseconds: widget.millisecond != null ? widget.millisecond! + 300 : 700));
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.2),
      end: Offset.zero,
    ).animate(_slideController);

    _doubleAnimation = Tween<double>(begin: 0, end: 1).animate(_opacityController);

    _opacityController.addListener(() {
      setState(() {});
    });

    Future.delayed(Duration(milliseconds: widget.delay ?? 0), () {
      if (!mounted) return;
      _slideController.forward();
      _opacityController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AntiContainer(opacity: _doubleAnimation.value, child: SlideTransition(position: _offsetAnimation, child: widget.child));
  }
}
