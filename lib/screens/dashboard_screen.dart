import 'package:flutter/material.dart';
import 'package:tlcn_project/widgets/drawer/drawer_utils.dart';
import 'package:tlcn_project/widgets/drawer/drawer_widget.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  DrawerTopList getDrawerTopList() {
    return DrawerTopList(
        'Bubble tea', const AssetImage('assets/images/icon_logo.jpg'));
  }

  List<DrawerListItem> getDrawerListItems() {
    return [
      DrawerListItem(
        DrawerHead('Dashboard'),
        [
          DrawerItem('Dashboard', Icons.dashboard_rounded),
          DrawerItem('Products', Icons.emoji_food_beverage),
          DrawerItem('Dashboard', Icons.group),
          DrawerItem('Dashboard', Icons.dashboard_rounded),
          DrawerItem('Dashboard', Icons.dashboard_rounded),
        ],
      ),
      DrawerListItem(
        DrawerHead('Settings'),
        [
          DrawerItem('Change Settings', Icons.dashboard_rounded),
          DrawerItem('Products', Icons.emoji_food_beverage),
          DrawerItem('Dashboard', Icons.group),
          DrawerItem('Dashboard', Icons.dashboard_rounded),
          DrawerItem('Dashboard', Icons.dashboard_rounded),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidgetCustom(list: [], title: getDrawerTopList()),
    );
  }
}
