import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tlcn_project/models/rank_model.dart';

import 'package:tlcn_project/widgets/dashboard/filter/filter_widget.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/widgets/dashboard/list//list_widget.dart';
import 'package:tlcn_project/widgets/dashboard/total_widget.dart';
import 'package:tlcn_project/widgets/paging/paging_widget.dart';

import 'package:tlcn_project/models/total_model.dart';

class MemberDashBoard extends StatelessWidget {
  const MemberDashBoard({Key? key}) : super(key: key);

  List<TotalModel> getTotalList() {
    var format = DateFormat('dd/MM/yyyy');
    return [
      TotalModel(
        'BRONZE',
        'assets/images/icon_bronze.png',
        0xFFAD6239,
        100,
        0.25,
        format.format(
          DateTime.now(),
        ),
      ),
      TotalModel(
        'SLIVER',
        'assets/images/icon_sliver.png',
        0xFFD3E0E3,
        100,
        0.25,
        format.format(
          DateTime.now(),
        ),
      ),
      TotalModel(
        'GOLD',
        'assets/images/icon_gold.png',
        0xFFF5D142,
        100,
        0.25,
        format.format(
          DateTime.now(),
        ),
      ),
      TotalModel(
        'DIAMOND',
        'assets/images/icon_diamond.png',
        0xFFAF3BF7,
        100,
        0.25,
        format.format(
          DateTime.now(),
        ),
      ),
    ];
  }

  ListRow getListRow() {
    var header = RowHeader([
      "ID",
      'NAME',
      'MEMBER RANK',
      'TOTAL POINT',
      'USED POINT',
      'CURRENT POINT',
      'JOIN DATE',
      'ACTION'
    ]);
    var rows = <MemberRow>[
      for (var i = 0; i < 10; i++)
        MemberRow(
          Member(
              id: '1',
              name: 'Phan Trung Tin',
              image: 'https://genk.mediacdn.vn/139269124445442048/2022/5/16/photo-1-1652713299647160238202-1652713647852-16527136480582024311731.jpg',
              rank: Rank(
                'assets/images/icon_diamond.png',
                'Diamond',
                0xFFA020F0,
              ),
              totalPoint: 3107,
              usedPoint: 2022,
              currentPoint: 1095,
              joinDate: DateTime.now(),
              hide: false),
        ),
    ];
    var rate = <int>[1, 4, 2, 2, 2, 2, 2, 2];
    var table = ListRow(header: header, rows: rows, rate: rate);
    return table;
  }

  @override
  Widget build(BuildContext context) {
    var utils = getTotalList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: IntrinsicHeight(
            child: Row(
              children: utils
                  .map(
                    (util) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TotalWidget(util: util),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        const FilterWidget(
          hasCreate: false,
          items: [
            [
              'Rank',
              'Diamond',
              'Gold',
              'Sliver',
              'Bronze',
              'New',
            ],
            [
              'Sort by',
              'Member rank',
              'Total point',
              'Used point',
              'Current point',
              'Join date',
              'Action'
            ],
          ],
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
            child: ListWidget<MemberRow>(
              table: getListRow(),
            ),
          ),
        ),
        const PagingWidget(),
      ],
    );
  }
}
