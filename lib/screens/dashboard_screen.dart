import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/model/drawer_model.dart';
import 'package:tlcn_project/model/user_model.dart';
import 'package:tlcn_project/providers/auth_provider/auth_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/drawer_provider.dart';
import 'package:tlcn_project/widgets/dashboard/title/dashboard_title_widget.dart';
import 'package:tlcn_project/widgets/drawer/drawer_widget.dart';

import '../widgets/dashboard/body_dashboard.dart';


class DashBoardScreen extends StatefulWidget {
  static const String routeName = '/dashboard';

  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  late UserModel user;
  late DrawerItemModel drawerItem;

  @override
  void didChangeDependencies() {
    user = context.watch<AuthProvider>().user;
    drawerItem = context.watch<DashboardProvider>().itemSelected;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var user = context.watch<AuthProvider>().user;
    var drawerItem = context.watch<DashboardProvider>().itemSelected;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            DrawerWidget(
              duration: const Duration(milliseconds: 200),
              maxWidth: 236,
              minWidth: 64,
              title: Provider.of<DrawerProvider>(context, listen: false).drawerTitle,
              list: Provider.of<DrawerProvider>(context, listen: false).drawerItems,
            ),
            Expanded(
              child: Column(
                children: [
                  DashboardTitleWidget(drawerItem: drawerItem, user: user),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            children: const [
                              Expanded(
                                child: BodyDashBoard(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
