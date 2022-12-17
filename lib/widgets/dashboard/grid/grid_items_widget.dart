import 'package:flutter/material.dart';

class GridItemsWidget extends StatelessWidget {
  final List<Widget> list;
  final double padding;

  const GridItemsWidget({
    Key? key,
    required this.list,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child:  Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        spacing: padding,
        runSpacing: padding,
        children: list,
      ),
    );
  }
}
