import 'package:flutter/material.dart';
import 'package:tlcn_project/models/branch_model.dart';
import 'package:tlcn_project/models/store_model.dart';

import '../../services/rest_api/api.dart';
import '../../services/rest_api/api_error.dart';
import '../../services/rest_api/api_error_type.dart';
import '../../utils/store_util.dart';

enum StoresScreenType { main, edit }

class StoresProvider extends ChangeNotifier with ApiError {

  StoresScreenType _storesScreenType = StoresScreenType.main;
  StoresScreenType get storeScreenType => _storesScreenType;

  String search = '';
  String category = '';
  String sortBy = '';
  String sortOrder = '';

  bool loading = false;
  StoreModel _storeSelected = StoreModel(
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
  StoreModel get storeSelected => _storeSelected;
  List<StoreUtil> _storeUtils = [];
  List<Branch> get stores {
    return _storeUtils.map((e) => Branch.fromUtil(e)).toList();
  }

  void onCreate() {
    if (_storesScreenType != StoresScreenType.edit) {
      _storesScreenType = StoresScreenType.edit;
      notifyListeners();
    }
  }

  Future<void> loadStoreUtils(BuildContext context) async {
    await apiCallSafety(
          () => Api().getDioNotAuthor("store/admin-app/list", {
            'search': search,
            'category': category,
            'sortBy': sortBy,
            'sortOrder': sortOrder,
          }, context),
      onStart: () async {
        loading = true;
      },
      onCompleted: (bool? status, dynamic res) async {
        loading = false;
        if (status != null && status && res != null) {
          if (res["data"] != null) {
            _storeUtils = (res['data'] as List)
                .map((e) => StoreUtil.fromJson(e))
                .toList();
            notifyListeners();
          }
        }
      },
      onError: (dynamic error) async {
        final ApiErrorType errorType = await parseApiErrorType(error);
        error = errorType.message;
      },
      skipOnError: true,
    );
  }

  void selectStore(String id) {
    _storeSelected = StoreModel(
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

  @override
  Future<int> onApiError(error) {
    // TODO: implement onApiError
    throw UnimplementedError();
  }
}
