import 'package:flutter/material.dart';

import 'package:tlcn_project/resources/colors.dart';

import 'package:tlcn_project/widgets/drawer/drawer_list_item_widget.dart';

import 'package:tlcn_project/models/drawer_model.dart';

class DrawerWidget extends StatefulWidget {
  final List<DrawerItemsModel> list;
  final DrawerTitle title;
  final Duration duration;
  final double maxWidth;
  final double minWidth;

  const DrawerWidget({
    Key? key,
    required this.list,
    required this.title,
    required this.duration,
    required this.minWidth,
    required this.maxWidth,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );
  late bool showMax = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget getDrawer() {
    return Container(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: AnimatedBuilder(
          animation:
              CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
          builder: (BuildContext context, Widget? child) {
            return SizedBox(
              width: widget.minWidth +
                  (widget.maxWidth - widget.minWidth) * _controller.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Color(colors['light']!),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.only(top: 20),
                          width: widget.minWidth +
                              (widget.maxWidth - widget.minWidth) *
                                  _controller.value,
                          child: IconButton(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            onPressed: () {
                              showMax
                                  ? _controller.reverse()
                                  : _controller.forward();
                              showMax = !showMax;
                            },
                            icon: AnimatedIcon(
                              progress: _controller,
                              icon: AnimatedIcons.menu_close,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          width: widget.minWidth +
                              (widget.maxWidth - widget.minWidth) *
                                  _controller.value,
                          height: 64 * _controller.value,
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
                                      image: widget.title.imageProvider,
                                      height: 64,
                                      width: 64,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Flexible(
                                flex: 2,
                                child: Text(
                                  widget.title.title,
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
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  for (var item in widget.list)
                    DrawerListItemWidget(
                      controller: _controller,
                      item: item,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getDrawer();
  }
}
