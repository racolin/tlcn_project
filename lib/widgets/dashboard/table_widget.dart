import 'package:flutter/material.dart';
import 'package:tlcn_project/widgets/dashboard/row_util.dart';
import 'package:tlcn_project/widgets/dashboard/table_row_widget.dart';

class TableWidget extends StatelessWidget {
  final ListRow table;

  const TableWidget({
    Key? key,
    required this.table,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Colors.grey.withOpacity(0.6),
      ),
      child: Column(
        children: [
          HeaderWidget(
            header: table.header,
            rate: table.rate,
          ),
          for (var row in table.rows)
            MemberItemWidget(row: row as MemberRow, rate: table.rate)
        ],
      ),
    );
  }
}
