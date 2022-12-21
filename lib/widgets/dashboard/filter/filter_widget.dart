import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/products_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/stores_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_provider.dart';
import 'package:tlcn_project/widgets/dashboard/employee/create_employee_modal.dart';
import 'package:tlcn_project/widgets/dashboard/filter/filter_item_widget.dart';

class FilterWidget extends StatelessWidget {
  final List<List<String>> items;
  final bool hasCreate;

  const FilterWidget({
    Key? key,
    required this.hasCreate,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          if (hasCreate)
            TextButton(
              onPressed: () {
                String title =
                    Provider.of<DashboardProvider>(context, listen: false)
                        .itemSelected
                        .title;
                switch (title) {
                  case 'Employee':
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const CreateEmployeeModal();
                      },
                    );
                    return;
                  case 'Store':
                    Provider.of<StoresProvider>(context, listen: false).onCreate();
                    return;
                  case 'Product':
                    Provider.of<ProductsProvider>(context, listen: false).onCreate();
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
                  onPressed: () {},
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
