import 'package:flutter/material.dart';

class ExamPageRoute extends PageRoute {
  ExamPageRoute({@required this.direction, @required this.builder});

  final Direction direction;
  final WidgetBuilder builder;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: builder(context),
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 250);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final _primaryAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
    final _secondaryAnimation = CurvedAnimation(
      parent: secondaryAnimation,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );

    return direction == Direction.right
        ? SlideTransition(
            position: Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero)
                .animate(_secondaryAnimation),
            child: SlideTransition(
              position: Tween<Offset>(begin: Offset.zero, end: Offset(1.0, 0.0))
                  .animate(_primaryAnimation),
              child: child,
            ),
          )
        : SlideTransition(
            position: Tween<Offset>(begin: Offset.zero, end: Offset(-1.0, 0.0))
                .animate(_secondaryAnimation),
            child: SlideTransition(
              position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
                  .animate(_primaryAnimation),
              child: child,
            ),
          );
  }
}

enum Direction {
  left,
  right,
}
