import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tlcn_project/screens/auth_screen.dart';

void main() {
  runApp(MaterialApp(
    // theme: ThemeData(),
    home: Scaffold(
      body: const AuthScreen(),
    ),

    // onGenerateRoute: (settings) {
    //   if (settings.arguments != null) {
    //     switch (settings.arguments as String) {
    //       case AuthScreen.routeName:
    //         return MaterialPageRoute(
    //           builder: (context) => const AuthScreen(),
    //         );
    //     }
    //   }
    //   return MaterialPageRoute(builder: (context) => const AuthScreen());
    // },
  ));
}
