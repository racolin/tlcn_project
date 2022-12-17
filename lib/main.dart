import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/animation/slide_animation.dart';
import 'package:tlcn_project/providers/auth_provider/auth_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/drawer_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_provider.dart';
import 'package:tlcn_project/providers/auth_provider/shared_prefs_provider.dart';
import 'package:tlcn_project/screens/auth_screen.dart';
import 'package:tlcn_project/screens/dashboard_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<SharedPreferencesProvider>(
          create: (context) => SharedPreferencesProvider(),
        ),
        Provider<DrawerProvider>(
          create: (context) => DrawerProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(
            Provider.of<SharedPreferencesProvider>(context, listen: false),
          ),
        ),
        ChangeNotifierProvider<DashboardProvider>(
          create: (context) => DashboardProvider(),
        ),
      ],
      child: MaterialApp(
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
      ),
    ),
  );
}
