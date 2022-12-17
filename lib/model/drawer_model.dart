import 'package:flutter/widgets.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_type.dart';

class DrawerItemModel {
  final DashboardType dashboardType;
  final String title;
  final IconData iconData;

  DrawerItemModel(this.title, this.iconData,this.dashboardType,);

  @override
  bool operator ==(Object other) {
    if (other is! DrawerItemModel) {
      return false;
    }
    return other.dashboardType == dashboardType;
  }

  @override
  int get hashCode => Object.hash(title, iconData);
}

class DrawerHead {
  final String header;

  DrawerHead(this.header);
}

class DrawerItemsModel {
  final DrawerHead headerDrawer;
  final List<DrawerItemModel> items;

  DrawerItemsModel(this.headerDrawer, this.items);
}

class DrawerTitle {
  final String title;
  final ImageProvider imageProvider;

  DrawerTitle(this.title, this.imageProvider);
}

enum DrawerStatus {
  large, small, none
}