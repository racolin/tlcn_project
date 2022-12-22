import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/member_provider.dart';
import 'package:tlcn_project/services/safety/base_stateful.dart';

import 'package:tlcn_project/widgets/dashboard/filter/filter_widget.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/widgets/dashboard/list//list_widget.dart';
import 'package:tlcn_project/widgets/dashboard/total_widget.dart';
import 'package:tlcn_project/widgets/paging/paging_widget.dart';

import 'package:tlcn_project/models/total_model.dart';

import '../../../models/filter_field_model.dart';
import '../../../models/filter_model.dart';

class MemberDashBoard extends StatefulWidget {
  const MemberDashBoard({Key? key}) : super(key: key);

  @override
  State<MemberDashBoard> createState() => _MemberDashBoardState();
}

class _MemberDashBoardState extends BaseStateful<MemberDashBoard> {
  late MemberProvider _memberProvider;

  @override
  void initDependencies(BuildContext context) {
    super.initDependencies(context);
    _memberProvider = Provider.of<MemberProvider>(context, listen: false);
  }

  @override
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);
    _memberProvider.loadMemberUtils(context);
  }

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

  ListRow convertListRow(
    List<String> headers,
    List<MemberModel> members,
    List<int> rates,
  ) {
    var header = RowHeader(headers);
    var rows = members.map((e) => MemberRow(e)).toList();
    var table = ListRow(header: header, rows: rows, rate: rates);
    return table;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var utils = getTotalList();
    return Consumer<MemberProvider>(
      builder: (context, instance, child) => Column(
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
          FilterWidget(
            onCreate: (MemberModel member) {},
            items: [
              FilterModel(
                key: 'sortBy',
                name: 'Lọc theo',
                values: [
                  FilterFieldModel(value: '_id', name: 'Mã id'),
                  FilterFieldModel(value: 'email', name: 'Email'),
                  FilterFieldModel(value: 'mobile', name: 'Điện thoại'),
                  FilterFieldModel(value: 'firstName', name: 'Họ'),
                  FilterFieldModel(value: 'lastName', name: 'Tên'),
                ],
                itemSelected: 0,
              ),
              FilterModel(
                key: 'rank',
                name: 'Rank',
                values: [
                  FilterFieldModel(value: 'new', name: 'Mới'),
                  FilterFieldModel(value: 'bronze', name: 'Đồng'),
                  FilterFieldModel(value: 'sliver', name: 'Bạc'),
                  FilterFieldModel(value: 'gold', name: 'Vàng'),
                  FilterFieldModel(value: 'diamond', name: 'Kim cương'),
                ],
                itemSelected: 0,
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
              child: ListWidget<MemberRow>(
                table: convertListRow(
                  instance.headers,
                  instance.members,
                  instance.rates,
                ),
              ),
            ),
          ),
          const PagingWidget(),
        ],
      ),
    );
  }
}
