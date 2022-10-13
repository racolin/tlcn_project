import 'package:flutter/cupertino.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget pageEnter;
  final Widget? pageExit;
  final AxisDirection direction;

  SlidePageRoute({required this.pageEnter, required this.direction, this.pageExit,})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) {
            return pageEnter;
          },
          transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) {
            Offset enterOffset = Offset.zero;
            Offset exitOffset = Offset.zero;
            switch (direction) {
              case AxisDirection.left:
                enterOffset = const Offset(-1, 0);
                exitOffset = const Offset(1, 0);
                break;
              case AxisDirection.right:
                enterOffset = const Offset(1, 0);
                exitOffset = const Offset(-1, 0);
                break;
              case AxisDirection.down:
                enterOffset = const Offset(0, 1);
                exitOffset = const Offset(0, -1);
                break;
              case AxisDirection.up:
                enterOffset = const Offset(0, -1);
                exitOffset = const Offset(0, 1);
                break;
            }

            return SlideTransition(
              position: Tween<Offset>(begin: enterOffset, end: Offset.zero)
                  .animate(animation),
              child:
                  SlideTransition(
                  position: Tween<Offset>(begin: Offset.zero, end: exitOffset)
                      .animate(secondaryAnimation),
                  child: child,

                ),
        );
            }
  );

}