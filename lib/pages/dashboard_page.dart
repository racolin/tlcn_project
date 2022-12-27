import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/models/drawer_model.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/drawer_provider.dart';
import 'package:tlcn_project/widgets/dashboard/title/dashboard_title_widget.dart';
import 'package:tlcn_project/widgets/drawer/drawer_widget.dart';

import '../services/safety/base_stateful.dart';
import '../widgets/dashboard/body_dashboard.dart';

class DashBoardPageRoot extends StatelessWidget {
  static const String routeName = '/dashboard';
  const DashBoardPageRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DashboardProvider>(
      create: (context) => DashboardProvider(),
      builder: (_, __) {
        return const DashBoardPage();
      },
    );
  }
}


class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends BaseStateful<DashBoardPage> {
  late DrawerItemModel drawerItem;

  @override
  void initDependencies(BuildContext context) {
    drawerItem = context.watch<DashboardProvider>().itemSelected;
    context.read<DashboardProvider>().loadUser(context);
    super.initDependencies(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
              title: Provider.of<DrawerProvider>(context, listen: false)
                  .drawerTitle,
              list: Provider.of<DrawerProvider>(context, listen: false)
                  .drawerItems,
            ),
            Expanded(
              child: Column(
                children: [
                  DashboardTitleWidget(
                    drawerItem: drawerItem,
                    user: Provider.of<DashboardProvider>(context).user,
                  ),
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
