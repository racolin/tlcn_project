import 'package:tlcn_project/utils/category_short_util.dart';

import '../../services/rest_api/api.dart';

class ProductUtil {
  final String id;
  final String name;
  final List<String> images;
  final int originalPrice;
  final String description;
  final OptionUtil options;
  final int numberOfLikes;
  final bool deleted;
  final String slug;
  final String mainImage;
  final String categoryId;
  final String categoryName;
  final int saleOfWeek;
  final int changedAmount;
  final DateTime updatedAt;
  final List<CategoryShortUtil> allCategories;

  ProductUtil({
    required this.id,
    required this.name,
    required this.images,
    required this.originalPrice,
    required this.description,
    required this.options,
    required this.numberOfLikes,
    required this.deleted,
    required this.slug,
    required this.mainImage,
    required this.categoryName,
    required this.categoryId,
    required this.saleOfWeek,
    required this.changedAmount,
    required this.updatedAt,
    required this.allCategories,
  });

  factory ProductUtil.fromJson(Map<String, dynamic> json) {
    return ProductUtil(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      images: json['images'] == null
          ? []
          : (json['images'] as List)
              .map(
                (e) => Api().getFullImageUrl(e),
              )
              .toList(),
      originalPrice: json['originalPrice'] ?? 0,
      description: json['description'] ?? '',
      options: json['options'] == null
          ? OptionUtil.empty()
          : OptionUtil.fromJson(json['options']),
      numberOfLikes: json['numberOfLikes'] ?? 0,
      deleted: json['deleted'] ?? false,
      slug: json['slug'] ?? '',
      mainImage: Api().getFullImageUrl(
        json['mainImage'],
      ),
      categoryId: json['categoryId'] ?? '',
      categoryName: json['categoryName'] ?? '',
      changedAmount: json['changedAmount'] ?? 0,
      saleOfWeek: json['saleOfWeek'] ?? 0,
      updatedAt: json['description'] != null
          ? DateTime.parse(json['description'])
          : DateTime.now(),
      allCategories: json['allCategories'] == null
          ? []
          : (json['allCategories'] as List)
              .map((e) => CategoryShortUtil.fromJson(json['allCategories']))
              .toList(),
    );
  }

  factory ProductUtil.empty() {
    return ProductUtil.fromJson({});
  }
}

class OptionUtil {
  final List<SizeUtil> sizes;
  final List<ToppingUtil> toppings;

  OptionUtil({
    required this.sizes,
    required this.toppings,
  });

  factory OptionUtil.fromJson(Map<String, dynamic> json) {
    return OptionUtil(
      sizes: json['size'] == null
          ? []
          : (json['size'] as List)
              .map(
                (e) => SizeUtil.fromJson(e),
              )
              .toList(),
      toppings: json['topping'] == null
          ? []
          : (json['topping'] as List)
              .map(
                (e) => ToppingUtil.fromJson(e),
              )
              .toList(),
    );
  }

  factory OptionUtil.empty() {
    return OptionUtil.fromJson({});
  }
}

class SizeUtil {
  final String size;
  final int cost;

  SizeUtil({
    required this.size,
    required this.cost,
  });

  factory SizeUtil.fromJson(Map<String, dynamic> json) {
    return SizeUtil(
      size: json['size'] ?? "",
      cost: json['cost'] ?? 0,
    );
  }

  factory SizeUtil.empty() {
    return SizeUtil.fromJson({});
  }
}

class ToppingUtil {
  final String name;
  final int cost;

  ToppingUtil({
    required this.name,
    required this.cost,
  });

  factory ToppingUtil.fromJson(Map<String, dynamic> json) {
    return ToppingUtil(
      name: json['name'] ?? "",
      cost: json['cost'] ?? 0,
    );
  }

  factory ToppingUtil.empty() {
    return ToppingUtil.fromJson({});
  }
}
