import 'package:flutter/material.dart';

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
}

class StoreProduct {
  final String image;
  final String name;

  StoreProduct({
    required this.name,
    required this.image,
  });
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
}
