import 'package:flutter/cupertino.dart';
import 'package:tlcn_project/models/store_model.dart';

import '../../services/rest_api/api_error.dart';

class StoreProvider extends ChangeNotifier with ApiError {
  final StoreModel store;
  StoreProvider(this.store);

  void addService() {

  }

  void deleteService() {

  }

  void saveService(ServiceModel service) {

  }

  @override
  Future<int> onApiError(error) {
    // TODO: implement onApiError
    throw UnimplementedError();
  }
  // /api/v1/store/admin-app/list
}