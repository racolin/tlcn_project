import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tlcn_project/providers/dashboard_provider/dashboard_provider.dart';

import 'package:tlcn_project/widgets/drawer/drawer_item_widget.dart';

import 'package:tlcn_project/model/drawer_model.dart';

class DrawerListItemWidget extends StatefulWidget {
  final AnimationController controller;
  final DrawerItemsModel item;

  const DrawerListItemWidget({
    Key? key,
    required this.controller,
    required this.item,
  }) : super(key: key);

  @override
  State<DrawerListItemWidget> createState() => _DrawerListItemWidgetState();
}

class _DrawerListItemWidgetState extends State<DrawerListItemWidget> {
  late DashboardProvider selectedProvider;

  @override
  void didChangeDependencies() {
    selectedProvider = Provider.of<DashboardProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getTitle(),
        for (var item in widget.item.items)
            DrawerItemWidget(
              item: item,
              controller: widget.controller,
              isSelected: selectedProvider.itemSelected == item,
              click: () {
                if (selectedProvider.itemSelected != item) {
                  Provider.of<DashboardProvider>(
                    context,
                    listen: false,
                  ).select(item);
                }
              },
            ),
      ],
    );
  }

  Widget getTitle() {
    return Column(
      children: [
        SizeTransition(
          axis: Axis.vertical,
          sizeFactor: widget.controller,
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              widget.item.headerDrawer.header,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
        const Divider(
          height: 1,
        ),
      ],
    );
  }
}
