import 'package:flutter/material.dart';
import 'package:tlcn_project/widgets/dashboard/filter/filter_widget.dart';
import 'package:tlcn_project/model/row_model.dart';
import 'package:tlcn_project/widgets/dashboard/list/list_widget.dart';
import 'package:tlcn_project/widgets/paging/paging_widget.dart';

class EmployeeDashBoard extends StatelessWidget {
  const EmployeeDashBoard({Key? key}) : super(key: key);

  ListRow getListRow() {
    var header = RowHeader(
        ["ID", 'NAME', 'USERNAME', 'EMAIL', 'ROLE', 'JOIN DATE', 'ACTION']);
    var rows = [
      for (var i = 0; i < 10; i++)
        EmployeeRow(
          Employee(
            id: '1',
            name: 'Phan Trung Tin',
            image: 'https://genk.mediacdn.vn/139269124445442048/2022/5/16/photo-1-1652713299647160238202-1652713647852-16527136480582024311731.jpg',
            username: 'admin1',
            email: 'phantrungtin01@gmail.com',
            role: 'admin',
            joinDate: DateTime.now(),
            hide: false,
          ),
        ),
    ];
    var rate = <int>[1, 4, 2, 4, 2, 2, 2];
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
              'Role',
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
