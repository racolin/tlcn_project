import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/employee_provider.dart';
import 'package:tlcn_project/services/safety/base_stateful.dart';
import 'package:tlcn_project/widgets/dashboard/filter/filter_widget.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/widgets/dashboard/list/list_widget.dart';
import 'package:tlcn_project/widgets/paging/paging_widget.dart';

import '../../../models/filter_field_model.dart';
import '../../../models/filter_model.dart';

class EmployeeDashBoard extends StatefulWidget {
  const EmployeeDashBoard({Key? key}) : super(key: key);

  @override
  State<EmployeeDashBoard> createState() => _EmployeeDashBoardState();
}

class _EmployeeDashBoardState extends BaseStateful<EmployeeDashBoard> {
  late EmployeeProvider _employeeProvider;

  ListRow convertListRow(
      List<String> headers, List<EmployeeModel> employees, List<int> rates,) {
    var header = RowHeader(headers);
    var rows = employees.map((e) => EmployeeRow(e)).toList();
    var table = ListRow(header: header, rows: rows, rate: rates);
    return table;
  }

  @override
  void initDependencies(BuildContext context) {
    _employeeProvider = Provider.of<EmployeeProvider>(context, listen: false);
    super.initDependencies(context);
  }

  @override
  void afterFirstBuild(BuildContext context) {
    _employeeProvider.loadEmployeeUtils(context);
    super.afterFirstBuild(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        FilterWidget(
          onCreate: (EmployeeModel employee) {},
          items: [
            FilterModel(
              key: 'role',
              name: 'Lọc theo',
              values: [
                FilterFieldModel(value: 'salesman', name: 'Nhân viên'),
                FilterFieldModel(value: 'admin', name: 'Quản lý'),
              ],
              itemSelected: 0,
            ),
          ],
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
            child: ListWidget(
              table: convertListRow(
                _employeeProvider.headers,
                _employeeProvider.employees,
                _employeeProvider.rates,
              ),
            ),
          ),
        ),
        const PagingWidget(),
      ],
    );
  }
}
