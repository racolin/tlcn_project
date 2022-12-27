import 'package:flutter/material.dart';

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
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['updatedAt']),
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

class StoreInfoUtil {
  final StoreDetailUtil storeDetail;
  final List<ProductShortUtil> allProductsInShort;

  StoreInfoUtil({
    required this.storeDetail,
    required this.allProductsInShort,
  });

  factory StoreInfoUtil.fromJson(Map<String, dynamic> json) {
    return StoreInfoUtil(
      storeDetail: StoreDetailUtil.fromJson(json['storeDetail'] ?? {}),
      allProductsInShort: json['allProductsInShort'] == null
          ? []
          : (json['allProductsInShort'] as List)
              .map((e) => ProductShortUtil.fromJson(e))
              .toList(),
    );
  }
}

class StoreDetailUtil {
  final String id;
  final String name;
  final String slug;
  final List<String> images;
  final DailyTimeUtil dailyTime;
  final AddressUtil address;
  final bool openedStatus;
  final List<ProductShortUtil> unavailableProducts;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final DateTime deletedAt;

  StoreDetailUtil({
    required this.id,
    required this.name,
    required this.slug,
    required this.images,
    required this.dailyTime,
    required this.address,
    required this.openedStatus,
    required this.unavailableProducts,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.deletedAt,
  });

  factory StoreDetailUtil.fromJson(Map<String, dynamic> json) {
    return StoreDetailUtil(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      images: json['images'] == null
          ? []
          : (json['images'] as List)
              .map(
                (e) => Api().getFullImageUrl(e),
              )
              .toList(),
      dailyTime: DailyTimeUtil.fromJson(json['dailyTime'] ?? {}),
      address: AddressUtil.fromJson(json['address'] ?? {}),
      unavailableProducts: json['unavailableProducts'] == null
          ? []
          : (json['unavailableProducts'] as List)
              .map((e) => ProductShortUtil.fromJson(e))
              .toList(),
      openedStatus: json['openedStatus'] ?? false,
      createdAt: json['createdAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['updatedAt']),
      deleted: json['deleted'] ?? false,
      deletedAt: json['deletedAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['deletedAt']),
    );
  }

  factory StoreDetailUtil.empty() {
    return StoreDetailUtil.fromJson({});
  }
}

class AddressUtil {
  final String street;
  final String ward;
  final String district;
  final String city;
  final String country;

  AddressUtil({
    required this.street,
    required this.ward,
    required this.district,
    required this.city,
    required this.country,
  });

  factory AddressUtil.fromJson(Map<String, dynamic> json) {
    return AddressUtil(
      street: json['street'] ?? '',
      ward: json['ward'] ?? '',
      district: json['district'] ?? '',
      city: json['city'] ?? '',
      country: json['country'] ?? '',
    );
  }

  factory AddressUtil.empty() {
    return AddressUtil.fromJson({});
  }

  String toFullAddress() {
    return [
      street,
      ward,
      district,
      city,
      country,
    ].join(', ');
  }
}

class DailyTimeUtil {
  final DailyTimeHourUtil open;
  final DailyTimeHourUtil close;

  DailyTimeUtil({
    required this.open,
    required this.close,
  });

  factory DailyTimeUtil.fromJson(Map<String, dynamic> json) {
    return DailyTimeUtil(
      open: json['open'] == null
          ? DailyTimeHourUtil.empty()
          : DailyTimeHourUtil.fromJson(json['open']),
      close: json['close'] == null
          ? DailyTimeHourUtil.empty()
          : DailyTimeHourUtil.fromJson(json['close']),
    );
  }

  factory DailyTimeUtil.empty() {
    return DailyTimeUtil.fromJson({});
  }
}

class DailyTimeHourUtil {
  final int hour;
  final int minute;

  DailyTimeHourUtil({
    required this.hour,
    required this.minute,
  });

  factory DailyTimeHourUtil.fromJson(Map<String, dynamic> json) {
    return DailyTimeHourUtil(
      hour: json['hour'] ?? 0,
      minute: json['minute'] ?? 0,
    );
  }

  factory DailyTimeHourUtil.empty() {
    return DailyTimeHourUtil.fromJson({});
  }

  TimeOfDay toTimeOfDay() {
    return TimeOfDay(hour: hour, minute: minute);
  }
}

class ProductShortUtil {
  final String mainImage;
  final String id;
  final String name;
  final int originalPrice;

  factory ProductShortUtil.fromJson(Map<String, dynamic> json) {
    return ProductShortUtil(
      mainImage: Api().getFullImageUrl(json['mainImage']),
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      originalPrice: json['originalPrice'] ?? 0,
    );
  }

  ProductShortUtil({
    required this.mainImage,
    required this.id,
    required this.name,
    required this.originalPrice,
  });
}
