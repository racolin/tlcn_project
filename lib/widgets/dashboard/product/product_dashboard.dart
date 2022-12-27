import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_type.dart';
import 'package:tlcn_project/providers/dashboard_provider/products_provider.dart';
import 'package:tlcn_project/widgets/dashboard/filter/filter_widget.dart';
import 'package:tlcn_project/widgets/dashboard/grid/grid_item_widget.dart';
import 'package:tlcn_project/widgets/dashboard/grid/grid_items_widget.dart';
import 'package:tlcn_project/widgets/dashboard/list/list_widget.dart';
import 'package:tlcn_project/widgets/dashboard/manage_image/manage_images_widget.dart';
import 'package:tlcn_project/widgets/dashboard/product/product_detail_widget.dart';
import 'package:tlcn_project/models/product_model.dart';
import 'package:tlcn_project/widgets/paging/paging_widget.dart';

import '../../../models/filter_field_model.dart';
import '../../../models/filter_model.dart';
import '../../../services/safety/base_stateful.dart';

class ProductsDashboard extends StatefulWidget {
  const ProductsDashboard({Key? key}) : super(key: key);

  @override
  State<ProductsDashboard> createState() => _ProductsDashboardState();
}

class _ProductsDashboardState extends BaseStateful<ProductsDashboard> {
  late ProductsProvider _productsProvider;

  @override
  void initDependencies(BuildContext context) {
    _productsProvider = Provider.of<ProductsProvider>(context);
    super.initDependencies(context);
  }

  @override
  void afterFirstBuild(BuildContext context) {
    _productsProvider.loadProductUtils(context);
    super.afterFirstBuild(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    switch (_productsProvider.productsScreenType) {
      case ProductsScreenType.main:
        return getMain();
      case ProductsScreenType.edit:
        return getEdit(_productsProvider.productSelected);
      default:
        return getMain();
    }
  }

  Widget getMain() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FilterWidget(
          onCreate: (ProductModel product) {},
          items: [
            FilterModel(
              key: 'status',
              name: 'Trạng thái',
              values: [
                FilterFieldModel(value: '', name: 'Trạng thái'),
                FilterFieldModel(value: 'all', name: 'Tất cả'),
                FilterFieldModel(value: 'disabled', name: 'Disabled'),
                FilterFieldModel(value: 'enable', name: 'Enable'),
              ],
              itemSelected: 0,
            ),
            FilterModel(
              key: 'sortBy',
              name: 'Lọc theo',
              values: [
                FilterFieldModel(value: '', name: 'Lọc theo'),
                FilterFieldModel(value: '_id', name: 'Mã id'),
                FilterFieldModel(value: 'name', name: 'Tên'),
                FilterFieldModel(value: 'originalPrice', name: 'Giá cả'),
                FilterFieldModel(value: 'updatedAt', name: 'Cập nhật'),
                FilterFieldModel(value: 'saleOfWeek', name: 'Bán chạy'),
                FilterFieldModel(value: 'changedAmount', name: 'Thay đổi'),
                FilterFieldModel(value: 'categoryName', name: 'Tên nhóm'),
              ],
              itemSelected: 0,
            ),
            FilterModel(
              key: 'sortOrder',
              name: 'Sắp xếp',
              values: [
                FilterFieldModel(value: '', name: 'Sắp xếp'),
                FilterFieldModel(value: 'asc', name: 'Tăng dần'),
                FilterFieldModel(value: 'desc', name: 'Giảm dần'),
              ],
              itemSelected: 0,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 32.0),
          child: IntrinsicWidth(
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _productsProvider.setGridMode(false);
                    });
                  },
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(8),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: !_productsProvider.gridMode
                          ? Colors.red.withOpacity(0.8)
                          : Colors.blue.withOpacity(0.8),
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(8),
                      ),
                    ),
                    child: const Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _productsProvider.setGridMode(true);
                    });
                  },
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(8),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _productsProvider.gridMode
                          ? Colors.red.withOpacity(0.8)
                          : Colors.blue.withOpacity(0.8),
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(8),
                      ),
                    ),
                    child: const Icon(
                      Icons.grid_view,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Consumer<ProductsProvider>(
            builder: (context, instance, child) => _productsProvider.gridMode
                ? GridItemsWidget(
                    padding: 24,
                    list: instance.products
                        .map((product) => ProductItemGrid(product: product))
                        .toList(),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 32),
                    child: ListWidget<ProductRow>(
                      table: getListRow(),
                    ),
                  ),
          ),
        ),
        const PagingWidget(),
      ],
    );
  }

  ListRow getListRow() {
    var header = RowHeader([
      "ID",
      'NAME',
      'ORIGINAL PRICE',
      'SALES',
      'CATEGORY',
      'UPDATED AT',
      'ACTION'
    ]);
    var rows = <ProductRow>[
      for (var product in _productsProvider.products)
        ProductRow(product: product),
    ];
    var rate = <int>[1, 4, 2, 2, 2, 2, 2];
    var table = ListRow(header: header, rows: rows, rate: rate);
    return table;
  }

  Widget getEdit(ProductModel? product) {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: 396,
          padding: const EdgeInsets.all(16),
          child: const ManageImagesWidget(
            type: DashboardType.product,
            itemSize: Size(140, 140),
            padding: 8,
            // title: 'Products Images',
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ProductDetailWidget(product: product),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
