import 'package:flutter/material.dart';
import 'package:tlcn_project/resoures/colors.dart';
import 'package:tlcn_project/widgets/drawer/drawer_utils.dart';

class DrawerWidget extends StatefulWidget {
  final List<DrawerListItem> list;
  final DrawerTopList title;
  final Duration duration;
  final double maxWidth;
  final double minWidth;

  const DrawerWidget(
      {Key? key,
      required this.list,
      required this.title,
      required this.duration,
      required this.minWidth,
      required this.maxWidth,
      required})
      : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: widget.duration);
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return SizedBox(
          width: widget.minWidth +
              (widget.maxWidth - widget.minWidth) * _controller.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.list.fold(
              <Widget>[
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
                        child: IconButton(padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            const SizedBox(
                              width: 16,
                            ),
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
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ],
              (previousValue, element) {
                previousValue.addAll(
                  [
                    Column(
                      children: [
                        SizeTransition(
                          axis: Axis.vertical,
                          sizeFactor: _controller,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Text(
                              element.headerDrawer.header,
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
                    ),
                    for (var item in element.items)
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 12,
                              ),
                              Icon(
                                item.iconData,
                                color: Color(colors['grey']!),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              SizeTransition(
                                axis: Axis.horizontal,
                                sizeFactor: _controller,
                                child: Text(
                                  item.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(colors['grey']!),
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                );
                return previousValue;
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return getDrawer();
  }
}
