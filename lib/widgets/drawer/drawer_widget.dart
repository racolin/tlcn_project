import 'package:flutter/material.dart';
import 'package:tlcn_project/widgets/drawer/drawer_utils.dart';

class DrawerWidgetCustom extends StatelessWidget {
  final List<DrawerListItem> list;
  final DrawerTopList title;
  const DrawerWidgetCustom({
    Key? key,
    required this.list,
    required this.title,
  }) : super(key: key);

  List<Widget> getListItem() {
    return list.fold(
      <Widget>[],
      (previousValue, element) {
        previousValue.addAll(
          [
            Text(element.headerDrawer.header),
            const Divider(),
            for (var item in element.items)
              ListTile(
                leading: Icon(item.iconData),
                title: Text(item.title),
              ),
          ],
        );
        return previousValue;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getListItem(),
    );
  }
}
