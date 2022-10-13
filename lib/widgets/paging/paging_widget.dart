import 'package:flutter/material.dart';
import 'package:tlcn_project/widgets/paging/page_num_widget.dart';

class PagingWidget extends StatefulWidget {
  const PagingWidget({Key? key}) : super(key: key);

  @override
  State<PagingWidget> createState() => _PagingWidgetState();
}

class _PagingWidgetState extends State<PagingWidget> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 32),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: Colors.grey.withOpacity(0.6))),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const PageNumWidget(value: '<', isSelected: false),
          for (int i = 0; i < 5; i++)
            PageNumWidget(
                value: (i + 1).toString(), isSelected: indexSelected == i),
          const PageNumWidget(value: '>', isSelected: false),
        ],
      ),
    );
  }
}
