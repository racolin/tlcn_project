import 'package:tlcn_project/utils/product_util.dart';

class ProductModel {
  final String id;
  final String image;
  final String name;
  final double price;
  final int perWeek;
  final String category;
  final DateTime dateTime;
  final bool hide;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.perWeek,
    required this.category,
    required this.dateTime,
    required this.hide,
  });

  factory ProductModel.fromUtil(ProductUtil util) {
    return ProductModel(
      id: util.id,
      image: util.mainImage,
      name: util.name,
      price: util.originalPrice.toDouble(),
      perWeek: util.saleOfWeek,
      category: util.categoryName,
      dateTime: util.updatedAt,
      hide: util.deleted,
    );
  }
}
