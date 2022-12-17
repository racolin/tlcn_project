import 'package:flutter/material.dart';
import 'package:tlcn_project/models/drawer_model.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_type.dart';

class DashboardProvider extends ChangeNotifier {

  var _itemSelected = DrawerItemModel('Member', Icons.group, DashboardType.member);

  void select(DrawerItemModel drawerItem) {
    _itemSelected = drawerItem;
    notifyListeners();
  }

  DrawerItemModel get itemSelected => _itemSelected;
}