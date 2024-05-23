import 'package:flutter/cupertino.dart';

import 'screen/index.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => PekemonScreen(),
};

PageRoute screenTransitions(settings) {
  const int duration = 500;
  List<String> slideHorizontal = [];
  List<String> slideVertical = [];
  List<String> sizeTransition = [];
  List<String> scaleTransition = [];
  List<String> rotationTransition = [];
  List<String> fadeTransition = ['/'];

  if (fadeTransition.contains(settings.name)) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => routes[settings.name]!(context),
      transitionDuration: const Duration(milliseconds: duration),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

  if (sizeTransition.contains(settings.name)) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => routes[settings.name]!(context),
      transitionDuration: const Duration(milliseconds: duration),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => Align(
        child: SizeTransition(
          sizeFactor: animation,
          child: child,
        ),
      ),
    );
  }

  if (slideHorizontal.contains(settings.name)) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => routes[settings.name]!(context),
      transitionDuration: const Duration(milliseconds: duration),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
        position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(animation),
        child: child,
      ),
    );
  }

  if (scaleTransition.contains(settings.name)) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => routes[settings.name]!(context),
      transitionDuration: const Duration(milliseconds: duration),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }

  if (rotationTransition.contains(settings.name)) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => routes[settings.name]!(context),
      transitionDuration: const Duration(milliseconds: duration),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => RotationTransition(
        turns: animation,
        child: child,
      ),
    );
  }

  if (slideVertical.contains(settings.name)) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => routes[settings.name]!(context),
      transitionDuration: const Duration(milliseconds: duration),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // const begin = Offset(1.0, 1.0);
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

  return CupertinoPageRoute(
    builder: (context) => routes[settings.name]!(context),
  );

  // Other route
  // return MaterialPageRoute(builder: (context) => routes[settings.name]!(context));
}
