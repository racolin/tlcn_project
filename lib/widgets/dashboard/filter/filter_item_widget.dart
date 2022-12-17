import 'package:flutter/material.dart';

class FilterItemWidget extends StatefulWidget {
  final List<String> items;

  const FilterItemWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<FilterItemWidget> createState() => _FilterItemWidgetState();
}

class _FilterItemWidgetState extends State<FilterItemWidget> {
  var selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButton<int>(
        borderRadius: BorderRadius.circular(16),
        underline: const SizedBox(),
        items: [
          for (int i = 0; i < widget.items.length; i++)
            DropdownMenuItem(
              value: i,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Text(widget.items[i]),
              ),
            ),
        ],
        value: selected,
        onChanged: (value) {
          setState(() {
            selected = value!;
          });
        },
      ),
    );
  }
}
