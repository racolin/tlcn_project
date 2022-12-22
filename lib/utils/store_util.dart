import '../services/rest_api/api.dart';

class StoreUtil {
  final String id;
  final String name;
  final DateTime updatedAt;
  final String mainImage;
  final String fullAddress;
  final SaleUtil sale;

  StoreUtil({
    required this.id,
    required this.name,
    required this.updatedAt,
    required this.mainImage,
    required this.fullAddress,
    required this.sale,
  });

  factory StoreUtil.fromJson(Map<String, dynamic> json) {
    return StoreUtil(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      updatedAt: json['updatedAt'] == null ? DateTime.now() : DateTime.parse(json['updatedAt']),
      mainImage: Api().getFullImageUrl(
        json['mainImage'],
      ),
      fullAddress: json['fullAddress'] ?? '',
      sale: SaleUtil.fromJson(json['sale'] ?? {}),
    );
  }
}

class SaleUtil {
  final int saleAmountOfWeek;
  final int changeAmountOfWeek;
  final int salePriceOfWeek;
  final int changePriceOfWeek;

  SaleUtil({
    required this.saleAmountOfWeek,
    required this.changeAmountOfWeek,
    required this.salePriceOfWeek,
    required this.changePriceOfWeek,
  });

  factory SaleUtil.fromJson(Map<String, dynamic> json) {
    return SaleUtil(
      saleAmountOfWeek: json['saleAmountOfWeek'] ?? 0,
      changeAmountOfWeek: json['changeAmountOfWeek'] ?? 0,
      salePriceOfWeek: json['salePriceOfWeek'] ?? 0,
      changePriceOfWeek: json['changePriceOfWeek'] ?? 0,
    );
  }
}
