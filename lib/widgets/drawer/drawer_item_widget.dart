import 'package:flutter/material.dart';

import 'package:tlcn_project/resources/colors.dart';

import 'package:tlcn_project/model/drawer_model.dart';

class DrawerItemWidget extends StatelessWidget {
  final DrawerItemModel item;
  final AnimationController controller;
  final bool isSelected;
  final VoidCallback click;

  const DrawerItemWidget({
    Key? key,
    required this.item,
    required this.controller,
    required this.isSelected,
    required this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.horizontal(right: Radius.circular(16)),
      onTap: click,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          color: isSelected ? Colors.blue : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 12,
            ),
            Icon(
              item.iconData,
              color: isSelected ? Colors.white : Color(colors['grey']!),
            ),
            const SizedBox(
              width: 12,
            ),
            SizeTransition(
              axis: Axis.horizontal,
              sizeFactor: controller,
              child: Text(
                item.title,
                style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? Colors.white : Color(colors['grey']!),
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
