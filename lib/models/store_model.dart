import 'package:flutter/material.dart';
import 'package:tlcn_project/utils/store_util.dart';

class ServiceModel {
  final IconData icon;
  final String serviceName;

  ServiceModel({
    required this.icon,
    required this.serviceName,
  });
}

class ItemMenu {
  final StoreProduct storeProduct;
  final bool available;

  ItemMenu({
    required this.storeProduct,
    required this.available,
  });

  factory ItemMenu.fromUtil(ProductShortUtil util, bool unavailable) {
    return ItemMenu(
      storeProduct: StoreProduct.fromUtil(util),
      available: !unavailable,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is! ItemMenu) {
      return false;
    }
    return other.available == available && other.storeProduct.id == storeProduct.id;
  }

  @override
  int get hashCode => Object.hash(available, storeProduct.id);

}

class StoreProduct {
  final String id;
  final String image;
  final String name;

  StoreProduct({
    required this.id,
    required this.name,
    required this.image,
  });

  factory StoreProduct.fromUtil(ProductShortUtil util) {
    return StoreProduct(
      id: util.id,
      name: util.name,
      image: util.mainImage,
    );
  }
}

class StoreModel {
  final String id;
  final List<String> images;
  final String storeName;
  final TimeOfDay openTime;
  final TimeOfDay closeTime;
  final String address;
  final List<ServiceModel> storeServices;
  final List<ItemMenu> itemMenus;

  StoreModel({
    required this.id,
    required this.images,
    required this.storeName,
    required this.openTime,
    required this.closeTime,
    required this.address,
    required this.storeServices,
    required this.itemMenus,
  });

  factory StoreModel.fromUtil(StoreInfoUtil util) {
    List<ItemMenu> ims = [];
    for (var item in util.allProductsInShort) {
      ims.add(ItemMenu(
          storeProduct: StoreProduct.fromUtil(item),
          available: !util.storeDetail.unavailableProducts
              .any((e) => e.id == item.id)));
    }
    return StoreModel(
      id: util.storeDetail.id,
      images: util.storeDetail.images,
      storeName: util.storeDetail.name,
      openTime: util.storeDetail.dailyTime.open.toTimeOfDay(),
      closeTime: util.storeDetail.dailyTime.close.toTimeOfDay(),
      address: util.storeDetail.address.toFullAddress(),
      storeServices: [],
      itemMenus: ims,
    );
  }
}
