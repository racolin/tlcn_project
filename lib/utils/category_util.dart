import '../../services/rest_api/api.dart';
import 'category_short_util.dart';

class CategoryUtil extends CategoryShortUtil {
  final String type;
  final bool hot;
  final int order;

  CategoryUtil({
    required super.id,
    required super.name,
    required this.type,
    required super.image,
    required this.hot,
    required this.order,
    required super.slug,
  });

  factory CategoryUtil.fromJson(Map<String, dynamic> json) {
    return CategoryUtil(
      id: json['_id'] ?? "",
      name: json['name'] ?? "",
      type: json['type'] ?? "",
      image: Api().getFullImageUrl(json['image']),
      hot: json['hot'] ?? false,
      order: json['order'] ?? -1,
      slug: json['slug'] ?? "",
    );
  }

  factory CategoryUtil.empty() {
    return CategoryUtil.fromJson({});
  }
}