import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tlcn_project/models/branch_model.dart';
import 'package:tlcn_project/models/store_model.dart';

import '../../services/rest_api/api.dart';
import '../../services/rest_api/api_error.dart';
import '../../services/rest_api/api_error_type.dart';
import '../../utils/store_util.dart';
import 'package:http_parser/http_parser.dart';

enum StoresScreenType { main, edit }

class StoresProvider extends ChangeNotifier with ApiError {
  StoresScreenType _storesScreenType = StoresScreenType.main;

  StoresScreenType get storeScreenType => _storesScreenType;

  String keyword = '';
  Map<String, String> filter = {};

  List<String> deletedImages = [];
  List<Uint8List> newImages = [];

  bool loading = false;

  bool isCreate = false;

  StoreInfoUtil _storeSelected = StoreInfoUtil.fromJson({});
  StoreDetailUtil store = StoreDetailUtil.fromJson({});

  StoreModel get storeSelected {
    return StoreModel.fromUtil(_storeSelected);
  }

  List<StoreUtil> _storeUtils = [];

  List<Branch> get stores {
    return _storeUtils.map((e) => Branch.fromUtil(e)).toList();
  }

  void onCreate() {
    if (_storesScreenType != StoresScreenType.edit) {
      _storesScreenType = StoresScreenType.edit;
      isCreate = true;
      notifyListeners();
    }
  }

  void onCancel() {
    if (_storesScreenType != StoresScreenType.main) {
      _storesScreenType = StoresScreenType.main;
      notifyListeners();
    }
  }

  void onSearch(BuildContext context, String keyword) {
    this.keyword = keyword;
    loadStoreUtils(context);
  }

  String _getParams() {
    List<String> result = [];
    if (keyword.isNotEmpty) {
      result.add('keyword=$keyword');
    }
    filter.forEach((key, value) {
      if (value.isNotEmpty) {
        result.add('$key=$value');
      }
    });
    return result.isNotEmpty ? '?${result.join('&')}' : '';
  }

  Future<void> loadStoreUtils(BuildContext context) async {
    String param = _getParams();
    await apiCallSafety(
      () => Api().getDioNotAuthor("store/admin-app/list$param", {}, context),
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

  Future<void> loadDetailStoreUtil(BuildContext context, String id) async {
    await apiCallSafety(
      () => Api().getDioNotAuthor("store/admin-app/$id/detail", {}, context),
      onStart: () async {
        loading = true;
      },
      onCompleted: (bool? status, dynamic res) async {
        loading = false;
        if (status != null && status && res != null) {
          if (res["data"] != null) {
            _storeSelected = StoreInfoUtil.fromJson(res['data']);
            store = _storeSelected.storeDetail;
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

  void save(BuildContext context) {
    if (isCreate) {
      // saveStore(context);
    } else {
      // updateStore(context);
    }
  }

  void saveImages(BuildContext context) async {
    List<MultipartFile> files = newImages
        .map((newImage) => MultipartFile.fromBytes(
              newImage,
              contentType: MediaType('image', 'jpeg'),
            ))
        .toList();

    FormData data = FormData.fromMap({
      'deletedImages': jsonEncode(deletedImages),
      "newImages": files,
    });

    await apiCallSafety(
      () => Api().patchFileDio("store/${store.id}/update-image", data, context),
      onStart: () async {
        loading = true;
      },
      onCompleted: (bool? status, dynamic res) async {
        loading = false;
        if (status != null && status && res != null) {
          if (res["data"] != null) {
            _storeSelected = StoreInfoUtil.fromJson(res['data']);
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

  // Future<void> saveStore(BuildContext context) async {
  //   await apiCallSafety(
  //     () => Api().getDioNotAuthor("store/admin-app/$id/detail", {}, context),
  //     onStart: () async {
  //       loading = true;
  //     },
  //     onCompleted: (bool? status, dynamic res) async {
  //       loading = false;
  //       if (status != null && status && res != null) {
  //         if (res["data"] != null) {
  //           _storeSelected = StoreInfoUtil.fromJson(res['data']);
  //           notifyListeners();
  //         }
  //       }
  //     },
  //     onError: (dynamic error) async {
  //       final ApiErrorType errorType = await parseApiErrorType(error);
  //       error = errorType.message;
  //     },
  //     skipOnError: true,
  //   );
  // }
  //
  // Future<void> updateStore(BuildContext context) async {
  //   await apiCallSafety(
  //     () => Api().getDioNotAuthor("store/admin-app/$id/detail", {}, context),
  //     onStart: () async {
  //       loading = true;
  //     },
  //     onCompleted: (bool? status, dynamic res) async {
  //       loading = false;
  //       if (status != null && status && res != null) {
  //         if (res["data"] != null) {
  //           _storeSelected = StoreInfoUtil.fromJson(res['data']);
  //           notifyListeners();
  //         }
  //       }
  //     },
  //     onError: (dynamic error) async {
  //       final ApiErrorType errorType = await parseApiErrorType(error);
  //       error = errorType.message;
  //     },
  //     skipOnError: true,
  //   );
  // }

  void selectStore(BuildContext context, String id) {
    deletedImages = [];
    newImages = [];
    _storesScreenType = StoresScreenType.edit;
    isCreate = false;
    loadDetailStoreUtil(context, id);
  }

  @override
  Future<int> onApiError(error) {
    throw UnimplementedError();
  }

  void swap(String id) {
    print(id);
    int index = _storeSelected.allProductsInShort.indexWhere((e) => e.id == id);
    if (index != -1) {
      int i = _storeSelected.storeDetail.unavailableProducts
          .indexWhere((e) => e.id == id);
      if (i == -1) {
        _storeSelected.storeDetail.unavailableProducts.add(
          _storeSelected.allProductsInShort.firstWhere((e) => e.id == id),
        );
      } else {
        _storeSelected.storeDetail.unavailableProducts.removeAt(i);
      }
      notifyListeners();
    }
  }
}
