// import '../../services/cache/credential.dart';
// import '../../services/rest_api/api_user.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:provider/single_child_widget.dart';
//
// class AppRoute {
//   factory AppRoute() => _instance;
//
//   AppRoute._private();
//
//   ///#region ROUTE NAMES
//   /// -----------------
//   static const String routeRoot = '/';
//   static const String routeLogin = '/login';
//   static const String routeSignUp = '/signUp';
//   static const String routeProfile = '/profile';
//   static const String routeEditProfile = '/profileEdit';
//   static const String routeDashboard = '/dashboard';
//   static const String routeMain = '/main';
//   static const String routeMainAdmin = '/mainAdmin';
//   static const String routeProject = '/lessons';
//   static const String routeLessonInfo = '/lessonInfo';
//   static const String routeLessonNewInfo = '/lessonNewInfo';
//   static const String routeQuestions = '/questions';
//   static const String routeResults = '/results';
//   static const String routeNotification = '/notification';
//   static const String routePos = '/pos';
//   static const String routeShopInfoMng = '/ShopInfoMng';
//   static const String routePropertyEditMng = '/PropertyEditMng';
//   static const String routeLookupPage = '/LookupPage';
//   static const String routePickListPage = '/PickListPage';
//   static const String routeMultiValuePage = '/MultiValuePage';
//   static const String routeQRViewPage = '/QRViewPage';
//
//   ///#endregion
//
//   static final AppRoute _instance = AppRoute._private();
//
//   static AppRoute get I => _instance;
//
//   /// Create local provider
//   // MaterialPageRoute<dynamic>(
//   //             settings: settings,
//   //             builder: (_) => AppRoute.createProvider(
//   //                 (_) => HomeProvider(),
//   //                 HomePage(
//   //                   status: settings.arguments as bool,
//   //                 )))
//   static Widget createProvider<P extends ChangeNotifier>(
//     P Function(BuildContext context) provider,
//     Widget child,
//   ) {
//     return ChangeNotifierProvider<P>(
//       create: provider,
//       builder: (_, __) {
//         return child;
//       },
//     );
//   }
//
//   /// Create multi local provider
//   // MaterialPageRoute<dynamic>(
//   //             settings: settings,
//   //             builder: (_) => AppRoute.createProviders(
//   //                 <SingleChildWidget>[
//   //                     ChangeNotifierProvider<HomeProvider>(
//   //                         create: (BuildContext context) => HomeProvider()),
//   //                 ],
//   //                 HomePage(
//   //                   status: settings.arguments as bool,
//   //                 )))
//   static Widget createProviders(
//     List<SingleChildWidget> providers,
//     Widget child,
//   ) {
//     return MultiProvider(
//       providers: providers,
//       child: child,
//     );
//   }
//
//   /// App route observer
//   final RouteObserver<Route<dynamic>> routeObserver =
//       RouteObserver<Route<dynamic>>();
//
//   /// App global navigator key
//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
//   /// Get app context
//   BuildContext? get appContext => navigatorKey.currentContext;
//
//   /// Generate route for app here
//   Route<dynamic>? generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case routeRoot:
//         return MaterialPageRoute<dynamic>(
//             settings: settings,
//             builder: (_) => Material(
//                   child: Container(),
//                 ));
//       case routeLogin:
//         return MaterialPageRoute<dynamic>(
//             settings: settings,
//             builder: (_) => AppRoute.createProvider(
//                   (BuildContext context) => LoginProvider(ApiUser(),
//                       Provider.of<Credential>(context, listen: false)),
//                   LoginPage(),
//                 ));
//       case routeSignUp:
//         return MaterialPageRoute<dynamic>(
//             settings: settings,
//             builder: (_) => AppRoute.createProvider(
//                   (BuildContext context) => RegistorProvider(ApiUser(),
//                       Provider.of<Credential>(context, listen: false)),
//                   SignUpPage(),
//                 ));
//       case routeMain:
//         return MaterialPageRoute<dynamic>(
//             settings: settings, builder: (_) => RootApp());
//       case routeMainAdmin:
//         return MaterialPageRoute<dynamic>(
//             settings: settings, builder: (_) => MainAdminScreenPage());
//
//       case routeProfile:
//         return MaterialPageRoute<dynamic>(
//             settings: settings, builder: (_) => UserPageRoot());
//       case routeEditProfile:
//         return MaterialPageRoute<dynamic>(
//             settings: settings, builder: (_) => UserEditPageRoot());
//       case routeNotification:
//         return MaterialPageRoute<dynamic>(
//             settings: settings, builder: (_) => NotificationPage());
//       case routeLookupPage:
//         return MaterialPageRoute<dynamic>(
//             settings: settings,
//             builder: (_) => AppRoute.createProvider(
//                 (context) => LookupProvider(),
//                 LookupPage(
//                   label: (settings.arguments as List)[0],
//                   ent: (settings.arguments as List)[1],
//                   idParent: (settings.arguments as List)[2],
//                   param: (settings.arguments as List)[3],
//                   hint: (settings.arguments as List)[4],
//                   maxSelect: (settings.arguments as List)[5],
//                   rounded: (settings.arguments as List)[6],
//                   init: (settings.arguments as List)[7],
//                 )));
//       case routePickListPage:
//         return MaterialPageRoute<dynamic>(
//           settings: settings,
//           builder: (_) => WPickerValuePage(
//             attribute: (settings.arguments as List)[0],
//             label: (settings.arguments as List)[1],
//             options: (settings.arguments as List)[2],
//             hint: (settings.arguments as List)[3],
//           ),
//         );
//       case routeMultiValuePage:
//         return MaterialPageRoute<dynamic>(
//           settings: settings,
//           builder: (_) => WPickerMultiValuePage(
//             attribute: (settings.arguments as List)[0],
//             initValues: (settings.arguments as List)[1],
//             valuesSelect: (settings.arguments as List)[2],
//             hint: (settings.arguments as List)[3],
//             label: (settings.arguments as List)[4],
//           ),
//         );
//       case routePos:
//         return MaterialPageRoute<dynamic>(
//             settings: settings, builder: (_) => PosPageRoot());
//       case routeShopInfoMng:
//         return MaterialPageRoute<dynamic>(
//             settings: settings, builder: (_) => ShopInfoPageRoot());
//       case routePropertyEditMng:
//         return MaterialPageRoute<dynamic>(
//             settings: settings, builder: (_) => ProductPropertyEditPage());
//       case routeQRViewPage:
//         return MaterialPageRoute<dynamic>(
//             settings: settings,
//             builder: (_) => QRViewExample(
//                   qrViewPage: settings.arguments as QRVIEWPAGE,
//                 ));
//     }
//   }
// }
