import 'package:flutter/material.dart';
import 'package:tlcn_project/models/store_model.dart';

enum StoresScreenType { main, edit }

class StoresProvider extends ChangeNotifier {
  StoresScreenType _storesScreenType = StoresScreenType.main;
  StoreModel storeSelected = StoreModel(
    id: '1',
    images: [
      'https://i.imgur.com/rg3GBhd.jpg',
      'https://i.imgur.com/rg3GBhd.jpg',
      'https://i.imgur.com/rg3GBhd.jpg',
    ],
    storeName: 'HCM Huynh Tan Phat',
    openTime: const TimeOfDay(hour: 7, minute: 30),
    closeTime: const TimeOfDay(hour: 22, minute: 00),
    address: '300 Huynh Tan Phat, Phu Thuan, Quan 7, Ho Chi Minh City',
    storeServices: [
      ServiceModel(icon: Icons.car_rental, serviceName: 'Car parking'),
      ServiceModel(icon: Icons.home, serviceName: 'In-site service'),
      ServiceModel(icon: Icons.shopping_bag, serviceName: 'Pick up service'),
      ServiceModel(
          icon: Icons.directions_bike, serviceName: 'Delivery service'),
    ],
    itemMenus: [
      ItemMenu(
          storeProduct: StoreProduct(
            name: 'Bac Xiu',
            image:
                'https://genk.mediacdn.vn/139269124445442048/2022/5/16/photo-1-1652713299647160238202-1652713647852-16527136480582024311731.jpg',
          ),
          available: true),
      ItemMenu(
          storeProduct: StoreProduct(
            name: 'Tra den Machiato',
            image:
                'https://genk.mediacdn.vn/139269124445442048/2022/5/16/photo-1-1652713299647160238202-1652713647852-16527136480582024311731.jpg',
          ),
          available: false),
      ItemMenu(
          storeProduct: StoreProduct(
            name: 'Hi-Tea dau tay man muoi Aloe Vera',
            image:
                'https://genk.mediacdn.vn/139269124445442048/2022/5/16/photo-1-1652713299647160238202-1652713647852-16527136480582024311731.jpg',
          ),
          available: true),
    ],
  );

  StoresScreenType get storeScreenType => _storesScreenType;

  void create() {
    if (_storesScreenType != StoresScreenType.edit) {
      _storesScreenType = StoresScreenType.edit;
      notifyListeners();
    }
  }

  void selectStore(String id) {
    storeSelected = StoreModel(
      id: id,
      images: [
        'https://i.imgur.com/rg3GBhd.jpg',
        'https://i.imgur.com/rg3GBhd.jpg',
        'https://i.imgur.com/rg3GBhd.jpg',
      ],
      storeName: 'The Coffee House',
      openTime: const TimeOfDay(hour: 7, minute: 30),
      closeTime: const TimeOfDay(hour: 22, minute: 00),
      address: '300 Huynh Tan Phat, Phu Thuan, Quan 7, Ho Chi Minh City',
      storeServices: [
        ServiceModel(icon: Icons.car_rental, serviceName: 'Car parking'),
        ServiceModel(icon: Icons.home, serviceName: 'In-site service'),
        ServiceModel(icon: Icons.shopping_bag, serviceName: 'Pick up service'),
        ServiceModel(
            icon: Icons.directions_bike, serviceName: 'Delivery service'),
      ],
      itemMenus: [],
    );
    _storesScreenType = StoresScreenType.edit;
    notifyListeners();
  }
}
