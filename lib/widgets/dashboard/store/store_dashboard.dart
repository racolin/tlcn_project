import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_type.dart';
import 'package:tlcn_project/providers/dashboard_provider/stores_provider.dart';
import 'package:tlcn_project/services/safety/base_stateful.dart';
import 'package:tlcn_project/widgets/dashboard/filter/filter_widget.dart';
import 'package:tlcn_project/widgets/dashboard/grid/grid_item_widget.dart';
import 'package:tlcn_project/widgets/dashboard/grid/grid_items_widget.dart';
import 'package:tlcn_project/widgets/dashboard/manage_image/manage_images_widget.dart';
import 'package:tlcn_project/models/store_model.dart';
import 'package:tlcn_project/widgets/dashboard/store/store_detail_widget.dart';
import 'package:tlcn_project/widgets/paging/paging_widget.dart';

import '../../../models/filter_field_model.dart';
import '../../../models/filter_model.dart';

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
    return Consumer<StoresProvider>(
      builder: (context, instance, child) {
        switch (instance.storeScreenType) {
          case StoresScreenType.main:
            return getMain();
          case StoresScreenType.edit:
            return getEdit(storeProvider.storeSelected);
          default:
            return getMain();
        }
      },
    );
  }

  Widget getMain() {
    return Column(
      children: [
        FilterWidget(
          onCreate: (StoreModel store) {},
          items: [
            FilterModel(
              key: 'status',
              name: 'Tr???ng th??i',
              values: [
                FilterFieldModel(value: '', name: 'Tr???ng th??i'),
                FilterFieldModel(value: 'all', name: 'T???t c???'),
                FilterFieldModel(value: 'disabled', name: 'Disabled'),
                FilterFieldModel(value: 'enable', name: 'Enable'),
              ],
              itemSelected: 0,
            ),
            FilterModel(
              key: 'sortBy',
              name: 'L???c theo',
              values: [
                FilterFieldModel(value: '', name: 'L???c theo'),
                FilterFieldModel(value: '_id', name: 'M?? id'),
                FilterFieldModel(value: 'title', name: 'T??n'),
                FilterFieldModel(value: 'code', name: 'M?? code'),
                FilterFieldModel(value: 'deleted', name: '???? xo??'),
              ],
              itemSelected: 0,
            ),
            FilterModel(
              key: 'sortOrder',
              name: 'S???p x???p',
              values: [
                FilterFieldModel(value: '', name: 'S???p x???p'),
                FilterFieldModel(value: 'asc', name: 'T??ng d???n'),
                FilterFieldModel(value: 'desc', name: 'Gi???m d???n'),
              ],
              itemSelected: 0,
            ),
          ],
        ),
        Consumer<StoresProvider>(
          builder: (context, instance, child) => Expanded(
            child: GridItemsWidget(
              padding: 24,
              list: instance.stores
                  .map((branch) => BranchItemGrid(
                      branch: branch,
                      onSelect: (id) {
                        storeProvider.selectStore(context, id);
                      }))
                  .toList(),
            ),
          ),
        ),
        const PagingWidget(),
      ],
    );
  }

  Widget getEdit(StoreModel store) {
    return SingleChildScrollView(padding: const EdgeInsets.all(32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!storeProvider.isCreate)
          Container(
            alignment: Alignment.topLeft,
            width: 396,
            padding: const EdgeInsets.all(16),
            child: const ManageImagesWidget(
              type: DashboardType.store,
              itemSize: Size(140, 140),
              padding: 8,
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: StoreDetailWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
