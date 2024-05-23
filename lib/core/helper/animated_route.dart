import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AnimatedRoute {
  FADE_TRANSITION,
  SLIDE_HORIZONTAL,
  SLIDE_VERTICAL,
  SIZE_TRANSITION,
  SCALE_TRANSITION,
  ROTATION_TRANSITION,
}

PageRoute animatedRoute(Widget route,
    {String? name,
    Object? args,
    AnimatedRoute? animated,
    int duration = 300,
    bool opaque = true,
    bool isSwipeCardActive = false}) {
  // SLIDE_HORIZONTAL
  if (animated == AnimatedRoute.SLIDE_HORIZONTAL) {
    return PageRouteBuilder(
      opaque: opaque,
      settings: RouteSettings(name: name, arguments: args),
      pageBuilder: (context, animation, secondaryAnimation) => route,
      transitionDuration: Duration(milliseconds: duration),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
        position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(animation),
        child: child,
      ),
    );
  }
  // SLIDE_VERTICAL
  if (animated == AnimatedRoute.SLIDE_VERTICAL) {
    return PageRouteBuilder(
      opaque: opaque,
      settings: RouteSettings(name: name, arguments: args),
      pageBuilder: (context, animation, secondaryAnimation) => route,
      transitionDuration: Duration(milliseconds: duration),
      reverseTransitionDuration: Duration(milliseconds: duration),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  // SIZE_TRANSITION
  if (animated == AnimatedRoute.SIZE_TRANSITION) {
    return PageRouteBuilder(
      opaque: opaque,
      settings: RouteSettings(name: name, arguments: args),
      pageBuilder: (context, animation, secondaryAnimation) => route,
      transitionDuration: Duration(milliseconds: duration),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          Align(child: SizeTransition(sizeFactor: animation, child: child)),
    );
  }
  // SCALE_TRANSITION
  if (animated == AnimatedRoute.SCALE_TRANSITION) {
    return PageRouteBuilder(
      opaque: opaque,
      settings: RouteSettings(name: name, arguments: args),
      pageBuilder: (context, animation, secondaryAnimation) => route,
      transitionDuration: Duration(milliseconds: duration),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
  // ROTATION_TRANSITION
  if (animated == AnimatedRoute.ROTATION_TRANSITION) {
    return PageRouteBuilder(
      opaque: opaque,
      settings: RouteSettings(name: name, arguments: args),
      pageBuilder: (context, animation, secondaryAnimation) => route,
      transitionDuration: Duration(milliseconds: duration),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => RotationTransition(
        turns: animation,
        child: child,
      ),
    );
  }

  // FADE_SWIPE_TRANSITION
  if (animated == AnimatedRoute.FADE_TRANSITION) {
    return FadeRouteBuilder(builder: (context) => route, isSwipeCardActive: isSwipeCardActive);
  }

  return CupertinoPageRoute(
    builder: (context) => route,
  );

  // return SlideTransitionPageRoute(
  //   builder: (context) => route,
  // );

  // return PageRouteBuilder(
  //   opaque: opaque,
  //   settings: RouteSettings(name: name, arguments: args),
  //   pageBuilder: (context, animation, secondaryAnimation) => route,
  //   transitionDuration: Duration(milliseconds: duration),
  //   transitionsBuilder: (context, animation, secondaryAnimation, child) =>
  //       FadeTransition(opacity: animation, child: child),
  // );
}

class FadePageRoute<T> extends CupertinoPageRoute<T> {
  FadePageRoute({required super.builder});

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final widget = super.buildTransitions(context, animation, secondaryAnimation, child);
    if (widget is CupertinoPageTransition) {
      return FadeTransition(
        opacity: animation,
        child: widget.child,
      );
    } else {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    }
  }
}

class FadeRouteBuilder extends PageRouteBuilder {
  final Widget Function(BuildContext) builder;
  bool isSwipeCardActive = false;

  FadeRouteBuilder({required this.builder, this.isSwipeCardActive = false})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = 0.0;
            var end = 1.0;
            var curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            var fadeAnimation = animation.drive(tween);

            return FadeTransition(opacity: fadeAnimation, child: child);
          },
          transitionDuration: Duration(milliseconds: 500),
        );

  @override
  String get barrierLabel => "";

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  // Override buildTransitions to handle swipe back gesture
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (!isSwipeCardActive) {
      return GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 20) {
            Navigator.of(context).pop();
          }
        },
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    } else {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    }
  }
}
