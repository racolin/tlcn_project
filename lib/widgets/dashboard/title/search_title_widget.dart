import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/promotion_provider.dart';

import '../../../models/filter_model.dart';
import '../../../providers/dashboard_provider/coupon_provider.dart';
import '../../../providers/dashboard_provider/employee_provider.dart';
import '../../../providers/dashboard_provider/member_provider.dart';
import '../../../providers/dashboard_provider/products_provider.dart';
import '../../../providers/dashboard_provider/stores_provider.dart';
import '../filter/filter_item_widget.dart';

class SearchTitleWidget extends StatefulWidget {
  // final Function(String) onSearch;
  final List<FilterModel> items;

  const SearchTitleWidget({
    Key? key,
    // required this.onSearch,
    required this.items,
  }) : super(key: key);

  @override
  State<SearchTitleWidget> createState() => _SearchTitleWidgetState();
}

class _SearchTitleWidgetState extends State<SearchTitleWidget> {
  final _controllerSearch = TextEditingController();
  String title = '';

  @override
  void initState() {
    title = Provider.of<DashboardProvider>(context, listen: false)
        .itemSelected
        .title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 300,
          height: 48,
          child: TextField(
            controller: _controllerSearch,
            decoration: const InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(color: Colors.grey),
          ),
          child: Text(
            context.watch<DashboardProvider>().itemSelected.title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        Row(
          children: [
            for (var item in widget.items)
              FilterItemWidget(
                items: item,
                onSelect: (select) {
                  item.itemSelected = select;
                },
              ),
          ],
        ),
        Container(
          height: 48,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: IconButton(
            onPressed: () {
              switch (Provider.of<DashboardProvider>(
                context,
                listen: false,
              ).itemSelected.title) {
                case 'Dashboard':
                  // Provider.of<ProductsProvider>(context, listen: false).onCreate();
                  return;
                case 'Employee':
                  var provider = Provider.of<EmployeeProvider>(
                    context,
                    listen: false,
                  );
                  provider.onSearch(context, _controllerSearch.text);
                  provider.filter = widget.items.fold({}, (pre, e) {
                    pre.addAll({e.key: e.values[e.itemSelected].value});
                    return pre;
                  });
                  return;
                case 'Store':
                  var provider = Provider.of<StoresProvider>(
                    context,
                    listen: false,
                  );
                  provider.filter = widget.items.fold({}, (pre, e) {
                    pre.addAll({e.key: e.values[e.itemSelected].value});
                    return pre;
                  });
                  provider.onSearch(context, _controllerSearch.text);
                  return;
                case 'Product':
                  var provider = Provider.of<ProductsProvider>(
                    context,
                    listen: false,
                  );
                  provider.filter = widget.items.fold({}, (pre, e) {
                    pre.addAll({e.key: e.values[e.itemSelected].value});
                    return pre;
                  });

                  provider.onSearch(context, _controllerSearch.text);
                  return;
                case 'Member':
                  var provider = Provider.of<MemberProvider>(
                    context,
                    listen: false,
                  );
                  provider.filter = widget.items.fold({}, (pre, e) {
                    pre.addAll({e.key: e.values[e.itemSelected].value});
                    return pre;
                  });
                  provider.onSearch(context, _controllerSearch.text);
                  return;
                case 'Coupon':
                  var provider = Provider.of<CouponProvider>(
                    context,
                    listen: false,
                  );
                  provider.filter = widget.items.fold({}, (pre, e) {
                    pre.addAll({e.key: e.values[e.itemSelected].value});
                    return pre;
                  });
                  provider.onSearch(context, _controllerSearch.text);
                  return;
                  return;
                case 'Promotion':
                  var provider = Provider.of<PromotionProvider>(
                    context,
                    listen: false,
                  );
                  provider.filter = widget.items.fold({}, (pre, e) {
                    pre.addAll({e.key: e.values[e.itemSelected].value});
                    return pre;
                  });
                  provider.onSearch(context, _controllerSearch.text);
                  return;
                case 'Order History':
                  // Provider.of<ProductsProvider>(context, listen: false).onCreate();
                  return;
              }
            },
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
