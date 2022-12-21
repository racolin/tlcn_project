import '../../services/rest_api/api.dart';

class CategoryShortUtil {
  final String id;
  final String name;
  final String image;
  final String slug;

  CategoryShortUtil({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
  });

  factory CategoryShortUtil.fromJson(Map<String, dynamic> json) {
    return CategoryShortUtil(
      id: json['_id'] ?? "",
      name: json['name'] ?? "",
      image: Api().getFullImageUrl(json['image']),
      slug: json['slug'] ?? "",
    );
  }

  factory CategoryShortUtil.empty() {
    return CategoryShortUtil.fromJson({});
  }
}