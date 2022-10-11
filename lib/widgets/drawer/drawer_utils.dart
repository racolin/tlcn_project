import 'package:flutter/widgets.dart';

class DrawerItem {
  final String title;
  final IconData iconData;

  DrawerItem(this.title, this.iconData);
}

class DrawerHead {
  final String header;

  DrawerHead(this.header);
}

class DrawerListItem {
  final DrawerHead headerDrawer;
  final List<DrawerItem> items;

  DrawerListItem(this.headerDrawer, this.items);
}

class DrawerTopList {
  final String title;
  final ImageProvider imageProvider;

  DrawerTopList(this.title, this.imageProvider);
}
