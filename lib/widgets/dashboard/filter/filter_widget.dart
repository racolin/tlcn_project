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
    String title =
        Provider.of<DashboardProvider>(context, listen: false)
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
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                for (var item in items)
                  FilterItemWidget(
                    items: item,
                    onSelect: (select) {
                      item.itemSelected = select;
                    },
                  ),
                OutlinedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    switch (title) {
                      case 'Employee':
                        var provider = Provider.of<EmployeeProvider>(context, listen: false);
                        provider.filter = items.fold({}, (pre, e) {
                          pre.addAll({e.key: e.values[e.itemSelected].value});
                          return pre;
                        });
                        provider.loadEmployeeUtils(context);
                        return;
                      case 'Store':
                        var provider = Provider.of<StoresProvider>(context, listen: false);
                        provider.filter = items.fold({}, (pre, e) {
                          pre.addAll({e.key: e.values[e.itemSelected].value});
                          return pre;
                        });
                        provider.loadStoreUtils(context);
                        return;
                      case 'Product':
                        var provider = Provider.of<ProductsProvider>(context, listen: false);
                        provider.filter = items.fold({}, (pre, e) {
                          pre.addAll({e.key: e.values[e.itemSelected].value});
                          return pre;
                        });
                        provider.loadProductUtils(context);
                        return;
                      case 'Dashboard':
                        // Provider.of<ProductsProvider>(context, listen: false).onCreate();
                        return;
                      case 'Member':
                        var provider = Provider.of<MemberProvider>(context, listen: false);
                        provider.filter = items.fold({}, (pre, e) {
                          pre.addAll({e.key: e.values[e.itemSelected].value});
                          return pre;
                        });
                        provider.loadMemberUtils(context);
                        return;
                      case 'Coupon':
                        // Provider.of<ProductsProvider>(context, listen: false).onCreate();
                        return;
                      case 'Promotion':
                        // Provider.of<ProductsProvider>(context, listen: false).onCreate();
                        return;
                      case 'Order History':
                        // Provider.of<ProductsProvider>(context, listen: false).onCreate();
                        return;
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: const Text('Filter'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
