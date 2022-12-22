import 'package:flutter/material.dart';
import 'package:tlcn_project/models/rank_model.dart';
import 'package:tlcn_project/widgets/dashboard/filter/filter_widget.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/widgets/dashboard/list/list_widget.dart';
import 'package:tlcn_project/widgets/paging/paging_widget.dart';

import '../../../models/filter_field_model.dart';
import '../../../models/filter_model.dart';

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
          promotion: PromotionModel(
            id: '1',
            partner: 'The Coffee house',
            title: 'Buy 1 get 1 Drink',
            applyTo: [
              RankModel('assets/images/icon_bronze.png', 'name', 0xFFFFFFFF),
              RankModel('assets/images/icon_sliver.png', 'name', 0xFFFFFFFF),
              RankModel('assets/images/icon_gold.png', 'name', 0xFFFFFFFF),
              RankModel('assets/images/icon_diamond.png', 'name', 0xFFFFFFFF),
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
        FilterWidget(
          onCreate: (PromotionModel promotion) {},
          items: [
            FilterModel(
              key: 'store',
              name: ' Cửa hàng',
              values: [
                FilterFieldModel(value: '_id', name: 'Partner'),
                FilterFieldModel(value: 'title', name: 'The Coffee House'),
                FilterFieldModel(value: 'code', name: 'Starbucks'),
              ],
              itemSelected: 0,
            ),
            FilterModel(
              key: 'applyTo',
              name: 'Áp dụng',
              values: [
                FilterFieldModel(value: 'new', name: 'Mới'),
                FilterFieldModel(value: 'bronze', name: 'Đồng'),
                FilterFieldModel(value: 'sliver', name: 'Bạc'),
                FilterFieldModel(value: 'gold', name: 'Vàng'),
                FilterFieldModel(value: 'diamond', name: 'Kim cương'),
              ],
              itemSelected: 0,
            ),
            FilterModel(
              key: 'status',
              name: 'Trạng thái',
              values: [
                FilterFieldModel(value: 'all', name: 'Tất cả'),
                FilterFieldModel(value: 'disabled', name: 'Disabled'),
                FilterFieldModel(value: 'enable', name: 'Enable'),
              ],
              itemSelected: 0,
            ),
            FilterModel(
              key: 'sortOrder',
              name: 'Sắp xếp',
              values: [
                FilterFieldModel(value: 'asc', name: 'Tăng dần'),
                FilterFieldModel(value: 'desc', name: 'Giảm dần'),
              ],
              itemSelected: 0,
            ),
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
