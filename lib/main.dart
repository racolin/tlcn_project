import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/pages/loading_page.dart';
import 'package:tlcn_project/providers/app/locale_provider.dart';
import 'package:tlcn_project/providers/auth_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/drawer_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_provider.dart';
import 'package:tlcn_project/pages/auth_page.dart';
import 'package:tlcn_project/pages/dashboard_page.dart';
import 'package:tlcn_project/services/cache/cache.dart';
import 'package:tlcn_project/services/cache/cache_preferences.dart';
import 'package:tlcn_project/services/cache/credential.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<DrawerProvider>(
          create: (context) => DrawerProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        // ChangeNotifierProvider<DashboardProvider>(
        //   create: (context) => DashboardProvider(),
        // ),
        ChangeNotifierProvider<LocaleProvider>(
            create: (BuildContext context) => LocaleProvider()),
        ChangeNotifierProvider<Credential>(
          create: (BuildContext context) => Credential(
            Provider.of<Cache>(context, listen: false),
          ),
        ),
        Provider<Cache>(create: (_) => CachePreferences()),
      ],
      child: MaterialApp(
        // theme: ThemeData(),
        // home: const Scaffold(
        //   body: AuthScreen(),
        // ),
        routes: {
          AuthPage.routeName: (context) => const AuthPage(),
          DashBoardPageRoot.routeName: (context) => const DashBoardPageRoot(),
          LoadingPage.routeName: (context) => const LoadingPage(),
        },
        initialRoute: LoadingPage.routeName,
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
