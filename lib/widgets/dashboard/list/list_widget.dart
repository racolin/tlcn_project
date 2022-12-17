import 'package:flutter/material.dart';
import 'package:tlcn_project/model/row_model.dart';
import 'package:tlcn_project/widgets/dashboard/list/coupon_item_widget.dart';
import 'package:tlcn_project/widgets/dashboard/list/employee_item_widget.dart';
import 'package:tlcn_project/widgets/dashboard/list/member_item_widget.dart';
import 'package:tlcn_project/widgets/dashboard/list/product_item_widget.dart';
import 'package:tlcn_project/widgets/dashboard/list/promotion_item_widget.dart';
import 'package:tlcn_project/widgets/dashboard/list/header_widget.dart';

class ListWidget<T extends ItemRow> extends StatelessWidget {
  final ListRow table;

  const ListWidget({
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
          HeaderWidget(header: table.header, rate: table.rate),
          for (var row in table.rows)
            if (row is MemberRow)
              MemberItemWidget(row: row, rate: table.rate)
            else if (row is EmployeeRow)
              EmployeeItemWidget(row: row, rate: table.rate)
            else if (row is CouponRow)
              CouponItemWidget(row: row, rate: table.rate)
            else if (row is PromotionRow)
              PromotionItemWidget(row: row, rate: table.rate)
            else if (row is ProductRow)
              ProductItemWidget(row: row, rate: table.rate),
        ],
      ),
    );
  }
}
