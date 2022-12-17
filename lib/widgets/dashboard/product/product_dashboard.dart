import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/providers/dashboard_provider/products_provider.dart';
import 'package:tlcn_project/widgets/dashboard/filter/filter_widget.dart';
import 'package:tlcn_project/widgets/dashboard/grid/grid_item_widget.dart';
import 'package:tlcn_project/widgets/dashboard/grid/grid_items_widget.dart';
import 'package:tlcn_project/widgets/dashboard/list/list_widget.dart';
import 'package:tlcn_project/widgets/dashboard/manage_image/manage_images_widget.dart';
import 'package:tlcn_project/widgets/dashboard/product/product_detail_widget.dart';
import 'package:tlcn_project/models/product_model.dart';
import 'package:tlcn_project/widgets/paging/paging_widget.dart';

class ProductsDashboard extends StatefulWidget {
  const ProductsDashboard({Key? key}) : super(key: key);

  @override
  State<ProductsDashboard> createState() => _ProductsDashboardState();
}

class _ProductsDashboardState extends State<ProductsDashboard> {
  List<Product> getProducts() {
    return [
      for (var i = 0; i < 10; i++)
        Product(
          id: '1',
          image:
              'https://genk.mediacdn.vn/139269124445442048/2022/5/16/photo-1-1652713299647160238202-1652713647852-16527136480582024311731.jpg',
          name: 'Hi-Tea Đào',
          price: 29000,
          perWeek: 100,
          category: 'Drink',
          hide: false,
          dateTime: DateTime.now(),
        ),
    ];
  }

  late ProductsProvider productsProvider;

  @override
  void didChangeDependencies() {
    productsProvider = context.watch<ProductsProvider>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    switch (productsProvider.productsScreenType) {
      case ProductsScreenType.main:
        return getMain();
      case ProductsScreenType.edit:
        return getEdit(productsProvider.productSelected);
      default:
        return getMain();
    }
  }

  Widget getMain() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
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
        Padding(
          padding: const EdgeInsets.only(right: 32.0),
          child: IntrinsicWidth(
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      productsProvider.setGridMode(false);
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
                      color: !productsProvider.gridMode
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
                      productsProvider.setGridMode(true);
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
                      color: productsProvider.gridMode
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
          child: productsProvider.gridMode
              ? GridItemsWidget(
                  padding: 24,
                  list: getProducts()
                      .map((product) => ProductItemGrid(product: product))
                      .toList(),
                )
              : Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                child: ListWidget<ProductRow>(
                    table: getListRow(),
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
      for (var product in productsProvider.products)
        ProductRow(product: product),
    ];
    var rate = <int>[1, 4, 2, 2, 2, 2, 2];
    var table = ListRow(header: header, rows: rows, rate: rate);
    return table;
  }

  Widget getEdit(Product? product) {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: 396,
          padding: const EdgeInsets.all(16),
          child: const ManageImagesWidget(
            itemSize: Size(140, 140),
            padding: 8,
            title: 'Products Images',
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
