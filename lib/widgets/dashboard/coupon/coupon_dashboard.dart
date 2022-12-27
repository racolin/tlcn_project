import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/models/filter_field_model.dart';
import 'package:tlcn_project/models/filter_model.dart';
import 'package:tlcn_project/providers/dashboard_provider/coupon_provider.dart';
import 'package:tlcn_project/services/safety/base_stateful.dart';
import 'package:tlcn_project/widgets/dashboard/filter/filter_widget.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/widgets/dashboard/list/list_widget.dart';
import 'package:tlcn_project/widgets/paging/paging_widget.dart';

class CouponDashboard extends StatefulWidget {
  const CouponDashboard({Key? key}) : super(key: key);

  @override
  State<CouponDashboard> createState() => _CouponDashboardState();
}

class _CouponDashboardState extends BaseStateful<CouponDashboard> {

  late CouponProvider _provider;

  @override
  void initDependencies(BuildContext context) {
    _provider = context.read<CouponProvider>();
    super.initDependencies(context);
  }

  @override
  void afterFirstBuild(BuildContext context) {
    _provider.loadCoupons(context);
    super.afterFirstBuild(context);
  }

  ListRow convertListRow(
      List<String> headers,
      List<CouponModel> coupons,
      List<int> rates,
      ) {
    var header = RowHeader(headers);
    var rows = coupons
        .map((e) => CouponRow(
      coupon: e,
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
                FilterFieldModel(value: '_id', name: 'Mã id'),
                FilterFieldModel(value: 'title', name: 'Tên'),
                FilterFieldModel(value: 'code', name: 'Mã code'),
                FilterFieldModel(value: 'amountApplyHour', name: 'Thời hạn'),
                FilterFieldModel(value: 'deleted', name: 'Đã xoá'),
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
          onCreate: () {},
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
            child: Consumer<CouponProvider>(
              builder: (context, instance, child) => ListWidget(
                table: convertListRow(
                  instance.headers,
                  instance.coupons,
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
