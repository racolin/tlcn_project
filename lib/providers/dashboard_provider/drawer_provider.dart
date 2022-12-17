import 'package:flutter/material.dart';
import 'package:tlcn_project/models/drawer_model.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_type.dart';

class DrawerProvider {
  final drawerItems = [
    DrawerItemsModel(
      DrawerHead('Dashboard'),
      [
        DrawerItemModel('Dashboard', Icons.dashboard_rounded, DashboardType.dashboard),
        DrawerItemModel('Member', Icons.group, DashboardType.member),
        DrawerItemModel('Employee', Icons.work, DashboardType.employee),
        DrawerItemModel('Store', Icons.store, DashboardType.store),
        DrawerItemModel('Product', Icons.emoji_food_beverage, DashboardType.product),
        DrawerItemModel('Coupon', Icons.corporate_fare, DashboardType.coupon),
        DrawerItemModel('Promotion', Icons.rate_review, DashboardType.promotion),
      ],
    ),
    DrawerItemsModel(
      DrawerHead('Settings'),
      [
        DrawerItemModel('Member Settings', Icons.settings_accessibility, DashboardType.memberSettings),
        DrawerItemModel('App Settings', Icons.settings_applications, DashboardType.appSettings),
      ],
    ),
  ];

  final drawerTitle = DrawerTitle(
    'Bubble tea',
    const AssetImage('assets/images/icon_logo.png'),
  );

  List<DrawerItemModel> getDrawerItems() {
    return [for (var items in drawerItems) ...items.items
    ];
  }
}
