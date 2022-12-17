import 'package:flutter/material.dart';
import 'package:tlcn_project/model/product_model.dart';

enum ProductsScreenType { main, edit }

class ProductsProvider extends ChangeNotifier {
  ProductsScreenType _productsScreenType = ProductsScreenType.main;
  bool _gridMode = true;
  Product _productSelected = Product(
    id: '1',
    image: 'https://genk.mediacdn.vn/139269124445442048/2022/5/16/photo-1-1652713299647160238202-1652713647852-16527136480582024311731.jpg',
    name: 'Hi-Tea Đào',
    price: 29000,
    category: 'Drink',
    perWeek: 100,
    dateTime: DateTime.now(),
    hide: false,
  );
  final List<Product> _products = List.generate(10, (index) => Product(
    id: '1',
    image: 'https://genk.mediacdn.vn/139269124445442048/2022/5/16/photo-1-1652713299647160238202-1652713647852-16527136480582024311731.jpg',
    name: 'Hi-Tea Đào',
    price: 29000,
    category: 'Drink',
    perWeek: 100,
    dateTime: DateTime.now(),
    hide: false,
  ));

  bool get gridMode => _gridMode;

  List<Product> get products => _products;

  ProductsScreenType get productsScreenType => _productsScreenType;

  Product get productSelected => _productSelected;

  void setGridMode(bool gridMode) {
    _gridMode = gridMode;
    notifyListeners();
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

  void create() {
    _productsScreenType = ProductsScreenType.edit;
    notifyListeners();
  }
}
