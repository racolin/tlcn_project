import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/pages/auth_page.dart';
import 'package:tlcn_project/pages/dashboard_page.dart';
import 'package:tlcn_project/services/cache/cache.dart';

class LoadingPage extends StatelessWidget {
  static const routeName = 'loading_page';
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<Cache>().getData('access_token').then((value) {
      if (value != null && value != '' && value != 'null') {
        Navigator.pushReplacementNamed(context, DashBoardPageRoot.routeName);
      } else {
        Navigator.pushReplacementNamed(context, AuthPage.routeName);
      }
    });
    return const Center(child: CircularProgressIndicator(),);
  }
}
