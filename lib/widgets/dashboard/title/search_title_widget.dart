import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_provider.dart';

class SearchTitleWidget extends StatefulWidget {
  const SearchTitleWidget({Key? key}) : super(key: key);

  @override
  State<SearchTitleWidget> createState() => _SearchTitleWidgetState();
}

class _SearchTitleWidgetState extends State<SearchTitleWidget> {
  // var filter = '1';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 300,
          height: 48,
          child: TextField(
            decoration: InputDecoration(
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
            border: Border.all(color: Colors.grey),
          ),
          child: Text(context.watch<DashboardProvider>().itemSelected.title),
          // DropdownButton<String>(
          //     underline: const SizedBox(),
          //     value: filter,
          //     items: const [
          //       DropdownMenuItem(
          //         value: '1',
          //         child: Text('Dashboard'),
          //       ),
          //       DropdownMenuItem(
          //         value: '2',
          //         child: Text('Member'),
          //       ),
          //       DropdownMenuItem(
          //         value: '3',
          //         child: Text('Employee'),
          //       ),
          //       DropdownMenuItem(
          //         value: '4',
          //         child: Text('Store'),
          //       ),
          //       DropdownMenuItem(
          //         value: '5',
          //         child: Text('Product'),
          //       ),
          //       DropdownMenuItem(
          //         value: '6',
          //         child: Text('Coupon'),
          //       ),
          //       DropdownMenuItem(
          //         value: '7',
          //         child: Text('Member Settings'),
          //       ),
          //       DropdownMenuItem(
          //         value: '8',
          //         child: Text('App Settings'),
          //       ),
          //     ],
          //     onChanged: (value) {
          //       if (value != null) {
          //         setState(() {
          //           filter = value;
          //         });
          //       }
          //     }),
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
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
