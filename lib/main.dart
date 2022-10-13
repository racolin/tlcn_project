import 'package:flutter/material.dart';
import 'package:tlcn_project/animation/slide_animation.dart';
import 'package:tlcn_project/screens/auth_screen.dart';
import 'package:tlcn_project/screens/dashboard_screen.dart';

void main() {
  runApp(MaterialApp(
    // theme: ThemeData(),
    // home: const Scaffold(
    //   body: AuthScreen(),
    // ),
    routes: {
      AuthScreen.routeName: (context) => const AuthScreen(),
      DashBoardScreen.routeName: (context) => const DashBoardScreen(),
    },
    initialRoute: AuthScreen.routeName,
    // onGenerateRoute: (settings) {
    //   if (settings.name != null) {
    //     switch (settings.name as String) {
    //       case AuthScreen.routeName:
    //         return SlidePageRoute(
    //             pageEnter: const AuthScreen(), direction: AxisDirection.right);
    //       case DashBoardScreen.routeName:
    //         return SlidePageRoute(
    //             pageEnter: const DashBoardScreen(),
    //             direction: AxisDirection.right);
    //     }
    //   }
    //   return SlidePageRoute(
    //       pageEnter: const AuthScreen(), direction: AxisDirection.right);
    // },
  ),);
}
