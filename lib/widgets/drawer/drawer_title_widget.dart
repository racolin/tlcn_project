import 'package:flutter/material.dart';

import 'package:tlcn_project/resources/colors.dart';

import 'package:tlcn_project/models/drawer_model.dart';

class DrawerTitleWidget extends StatelessWidget {
  final AnimationController controller;
  final double minWidth, maxWidth;
  final bool showMax;
  final DrawerTitle title;

  const DrawerTitleWidget({
    Key? key,
    required this.controller,
    required this.minWidth,
    required this.maxWidth,
    required this.showMax,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Color(colors['light']!),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(top: 20),
            width: minWidth +
                (maxWidth - minWidth) * controller.value,
            child: IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              onPressed: () {
                showMax ? controller.reverse() : controller.forward();
                // showMax = !showMax;
              },
              icon: AnimatedIcon(
                progress: controller,
                icon: AnimatedIcons.menu_close,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 16.0),
            width: minWidth +
                (maxWidth - minWidth) * controller.value,
            height: 64 * controller.value,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image(
                        image: title.imageProvider,
                        height: 64,
                        width: 64,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    title.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
