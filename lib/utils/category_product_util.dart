import '../../utils/category_util.dart';
import '../../utils/product_util.dart';

class CategoryProductUtil {
  final CategoryUtil category;
  final List<ProductUtil> products;

  CategoryProductUtil({
    required this.category,
    required this.products,
  });

  factory CategoryProductUtil.fromJson(Map<String, dynamic> json) {
    return CategoryProductUtil(
      category: json['category'] == null
          ? CategoryUtil.empty()
          : CategoryUtil.fromJson(json['category']),
      products: json['products'] == null
          ? []
          : (json['products'] as List)
              .map((e) => ProductUtil.fromJson(e))
              .toList(),
    );
  }

  factory CategoryProductUtil.empty() {
    return CategoryProductUtil.fromJson({});
  }
}
