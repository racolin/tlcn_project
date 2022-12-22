import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/stores_provider.dart';
import 'package:tlcn_project/services/safety/base_stateful.dart';
import 'package:tlcn_project/widgets/dashboard/filter/filter_widget.dart';
import 'package:tlcn_project/widgets/dashboard/grid/grid_item_widget.dart';
import 'package:tlcn_project/widgets/dashboard/grid/grid_items_widget.dart';
import 'package:tlcn_project/widgets/dashboard/manage_image/manage_images_widget.dart';
import 'package:tlcn_project/models/store_model.dart';
import 'package:tlcn_project/widgets/dashboard/store/store_detail_widget.dart';
import 'package:tlcn_project/widgets/paging/paging_widget.dart';

class StoresDashboard extends StatefulWidget {
  const StoresDashboard({Key? key}) : super(key: key);

  @override
  State<StoresDashboard> createState() => _StoresDashboardState();
}

class _StoresDashboardState extends BaseStateful<StoresDashboard> {
  late StoresProvider storeProvider;

  @override
  void afterFirstBuild(BuildContext context) {
    storeProvider.loadStoreUtils(context);
    super.afterFirstBuild(context);
  }

  @override
  void initDependencies(BuildContext context) {
    storeProvider = context.read<StoresProvider>();
    super.initDependencies(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
        Consumer<StoresProvider>(
          builder: (context, instance, child) => Expanded(
            child: GridItemsWidget(
              padding: 24,
              list: instance.stores
                  .map((branch) => BranchItemGrid(branch: branch))
                  .toList(),
            ),
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
