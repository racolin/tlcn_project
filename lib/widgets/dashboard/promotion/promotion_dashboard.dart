import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/promotion_provider.dart';
import 'package:tlcn_project/services/safety/base_stateful.dart';
import 'package:tlcn_project/widgets/dashboard/filter/filter_widget.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/widgets/dashboard/list/list_widget.dart';
import 'package:tlcn_project/widgets/paging/paging_widget.dart';

import '../../../models/filter_field_model.dart';
import '../../../models/filter_model.dart';

class PromotionDashboard extends StatefulWidget {
  const PromotionDashboard({Key? key}) : super(key: key);

  @override
  State<PromotionDashboard> createState() => _PromotionDashboardState();
}

class _PromotionDashboardState extends BaseStateful<PromotionDashboard> {
  late PromotionProvider _provider;

  @override
  void initDependencies(BuildContext context) {
    _provider = context.read<PromotionProvider>();
    super.initDependencies(context);
  }

  @override
  void afterFirstBuild(BuildContext context) {
    _provider.loadPromotions(context);
    super.afterFirstBuild(context);
  }

  ListRow convertListRow(
      List<String> headers, List<PromotionModel> promotions, List<int> rates) {
    var header = RowHeader(headers);
    var rows = promotions
        .map((e) => PromotionRow(
              promotion: e,
            ))
        .toList();
    return ListRow(header: header, rows: rows, rate: rates);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        FilterWidget(
          onCreate: (PromotionModel promotion) {},
          items: [
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
              key: 'sortBy',
              name: 'Lọc theo',
              values: [
                FilterFieldModel(value: '', name: 'Lọc theo'),
                FilterFieldModel(value: 'title', name: 'Tên'),
                FilterFieldModel(value: 'cost', name: 'Giá trị'),
                FilterFieldModel(value: 'opening', name: 'Mở cửa'),
                FilterFieldModel(value: 'deleted', name: 'Ẩn'),
                FilterFieldModel(value: 'coupon', name: 'Coupon'),
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
            child: Consumer<PromotionProvider>(
              builder: (context, instance, child) => ListWidget(
                table: convertListRow(
                  instance.headers,
                  instance.promotions,
                  instance.rates,
                ),
              ),
            ),
          ),
        ),
        const PagingWidget(),
      ],
    );
  }
}
