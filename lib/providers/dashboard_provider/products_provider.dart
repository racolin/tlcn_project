import 'package:flutter/material.dart';
import 'package:tlcn_project/models/product_model.dart';
import 'package:tlcn_project/utils/product_util.dart';

import '../../services/rest_api/api.dart';
import '../../services/rest_api/api_error_type.dart';
import '../../services/rest_api/api_error.dart';


enum ProductsScreenType { main, edit }

class ProductsProvider extends ChangeNotifier with ApiError {
  bool _gridMode = true;
  bool get gridMode => _gridMode;
  void setGridMode(bool gridMode) {
    _gridMode = gridMode;
    notifyListeners();
  }

  ProductsScreenType _productsScreenType = ProductsScreenType.main;
  ProductsScreenType get productsScreenType => _productsScreenType;

  bool loading = false;
  Product? _productSelected;
  List<ProductUtil> _productUtils = [];
  List<Product> get products => _productUtils.map((e) => Product.fromUtil(e)).toList();
  Product? get productSelected => _productSelected;

  Future<void> loadProductUtils(BuildContext context) async {
    await apiCallSafety(
          () => Api().getDioNotAuthor("product/admin/list", {}, context),
      onStart: () async {
        loading = true;
      },
      onCompleted: (bool? status, dynamic res) async {
        loading = false;
        if (status != null && status && res != null) {
          if (res["data"] != null) {
            _productUtils = (res['data'] as List)
                .map((e) => ProductUtil.fromJson(e))
                .toList();
            notifyListeners();
          }
        }
      },
      onError: (dynamic error) async {
        final ApiErrorType errorType = await parseApiErrorType(error);
        error = errorType.message;
      },
      skipOnError: true,
    );
  }

  void selectProduct(String id) {
    _productsScreenType = ProductsScreenType.edit;
    _productSelected = Product(
      id: '1',
      image: 'https://genk.mediacdn.vn/139269124445442048/2022/5/16/photo-1-1652713299647160238202-1652713647852-16527136480582024311731.jpg',
      name: 'Hi-Tea Đào',
      price: 29000,
      category: 'Drink',
      perWeek: 100,
      dateTime: DateTime.now(),
      hide: false,
    );
    notifyListeners();
  }

  void onCreate() {
    _productsScreenType = ProductsScreenType.edit;
    notifyListeners();
  }

  @override
  Future<int> onApiError(error) {
    // TODO: implement onApiError
    throw UnimplementedError();
  }
}
