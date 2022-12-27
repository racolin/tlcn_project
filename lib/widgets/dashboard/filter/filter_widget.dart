import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/models/filter_model.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/providers/dashboard_provider/employee_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/member_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/products_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/stores_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_provider.dart';
import 'package:tlcn_project/widgets/dashboard/employee/create_employee_modal.dart';
import 'package:tlcn_project/widgets/dashboard/filter/filter_item_widget.dart';

import '../title/search_title_widget.dart';

class FilterWidget extends StatelessWidget {
  final List<FilterModel> items;
  final Function? onCreate;

  const FilterWidget({
    Key? key,
    this.onCreate,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = Provider.of<DashboardProvider>(context, listen: false)
        .itemSelected
        .title;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          if (onCreate != null)
            TextButton(
              onPressed: () async {
                switch (title) {
                  case 'Employee':
                    EmployeeModel employee = await showDialog(
                      context: context,
                      builder: (context) {
                        return const CreateEmployeeModal();
                      },
                    );
                    if (onCreate != null) {
                      onCreate!(employee);
                    }
                    return;
                  case 'Store':
                    Provider.of<StoresProvider>(context, listen: false)
                        .onCreate();
                    return;
                  case 'Product':
                    Provider.of<ProductsProvider>(context, listen: false)
                        .onCreate();
                    return;
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  'Create',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          const Spacer(),
          SearchTitleWidget(items: items),
        ],
      ),
    );
  }
}
