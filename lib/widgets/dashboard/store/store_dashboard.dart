import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/stores_provider.dart';
import 'package:tlcn_project/widgets/dashboard/filter/filter_widget.dart';
import 'package:tlcn_project/model/branch_model.dart';
import 'package:tlcn_project/widgets/dashboard/grid/grid_item_widget.dart';
import 'package:tlcn_project/widgets/dashboard/grid/grid_items_widget.dart';
import 'package:tlcn_project/widgets/dashboard/manage_image/manage_images_widget.dart';
import 'package:tlcn_project/model/store_model.dart';
import 'package:tlcn_project/widgets/dashboard/store/store_detail_widget.dart';
import 'package:tlcn_project/widgets/paging/paging_widget.dart';

class StoresDashboard extends StatefulWidget {
  const StoresDashboard({Key? key}) : super(key: key);

  @override
  State<StoresDashboard> createState() => _StoresDashboardState();
}

class _StoresDashboardState extends State<StoresDashboard> {
  List<Branch> getBranches() {
    return [
      for (var i = 0; i < 10; i++)
        Branch(
          name: 'The Coffee House',
          image: 'https://i.imgur.com/rg3GBhd.jpg',
          description: '1 Vo Van Ngan Street, Linh Chieu Ward, Thu Duc City',
          opened: DateTime.now(),
        )
    ];
  }

  // StoreScreenType? type;
  late StoresProvider storeProvider;

  @override
  void didChangeDependencies() {
    storeProvider = context.watch<StoresProvider>();
    // .storeScreenType;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    switch (storeProvider.storeScreenType) {
      case StoresScreenType.main:
        return getMain();
      case StoresScreenType.edit:
        return getEdit(storeProvider.storeSelected);
      default:
        return getMain();
    }
  }

  Widget getMain() {
    return Column(
      children: [
        const FilterWidget(
          hasCreate: true,
          items: [
            [
              'Category',
              'The Coffee House',
              'Starbucks',
              'Caphe Trung Tin Pro',
            ],
            [
              'Sort by',
              'Diamond',
              'Gold',
              'Sliver',
            ],
          ],
        ),
        Expanded(
          child: GridItemsWidget(
            padding: 24,
            list: getBranches()
                .map((branch) => BranchItemGrid(branch: branch))
                .toList(),
          ),
        ),
        const PagingWidget(),
      ],
    );
  }

  Widget getEdit(StoreModel store) {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: 396,
          padding: const EdgeInsets.all(16),
          child: const ManageImagesWidget(
            itemSize: Size(140, 140),
            padding: 8,
            title: 'Store Images',
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: StoreDetailWidget(
                store: store,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
