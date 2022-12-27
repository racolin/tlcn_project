import 'package:flutter/material.dart';
import 'package:tlcn_project/models/filter_model.dart';

class FilterItemWidget extends StatefulWidget {
  final FilterModel items;
  final Function(int) onSelect;

  const FilterItemWidget({
    Key? key,
    required this.items,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<FilterItemWidget> createState() => _FilterItemWidgetState();
}

class _FilterItemWidgetState extends State<FilterItemWidget> {
  var selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(right: 24),
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        // borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<int>(
        isDense: true,
        borderRadius: BorderRadius.circular(4),
        underline: const SizedBox(),
        items: [
          for (int i = 0; i < widget.items.values.length; i++)
            DropdownMenuItem(
              value: i,
              child: Text(widget.items.values[i].name),
            ),
        ],
        value: selected,
        onChanged: (value) {
          if (value != null) {
            widget.onSelect(value);
            setState(() {
              selected = value;
            });
          }
        },
      ),
    );
  }
}
