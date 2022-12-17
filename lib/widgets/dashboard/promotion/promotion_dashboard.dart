import 'package:flutter/material.dart';
import 'package:tlcn_project/models/rank_model.dart';
import 'package:tlcn_project/widgets/dashboard/filter/filter_widget.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/widgets/dashboard/list/list_widget.dart';
import 'package:tlcn_project/widgets/paging/paging_widget.dart';

class PromotionDashboard extends StatelessWidget {
  const PromotionDashboard({Key? key}) : super(key: key);

  ListRow getListRow() {
    var header = RowHeader([
      "ID",
      'PARTNER',
      'TITLE',
      'APPLY TO',
      'COUPON',
      'COST',
      'STATUS',
      'ACTION'
    ]);
    var rows = [
      for (var i = 0; i < 10; i++)
        PromotionRow(
          promotion: Promotion(
            id: '1',
            partner: 'The Coffee house',
            title: 'Buy 1 get 1 Drink',
            applyTo: [
              Rank('assets/images/icon_bronze.png', 'name', 0xFFFFFFFF),
              Rank('assets/images/icon_sliver.png', 'name', 0xFFFFFFFF),
              Rank('assets/images/icon_gold.png', 'name', 0xFFFFFFFF),
              Rank('assets/images/icon_diamond.png', 'name', 0xFFFFFFFF),
            ],
            coupon: 'ABCXZYJKLUYIODHAKSJ',
            cost: '249',
            status: 'Own',
            hide: false,
          ),
        ),
    ];
    var rate = <int>[1, 3, 4, 4, 2, 2, 2, 2];
    var table = ListRow(header: header, rows: rows, rate: rate);
    return table;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FilterWidget(
          hasCreate: true,
          items: [
            [
              'Partner',
              'The Coffee House',
              'Starbucks',
              'Caphe Trung Tin Pro',
            ],
            [
              'Apply to',
              'Diamond',
              'Gold',
              'Sliver',
            ],
            [
              'Status',
              'Opening',
              'Closed',
              'Pending',
            ],
            [
              'Sort by',
              'Admin',
              'Salesperson',
              'Warehouse staff',
            ],
          ],
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
            child: ListWidget(
              table: getListRow(),
            ),
          ),
        ),
        const PagingWidget(),
      ],
    );
  }
}
