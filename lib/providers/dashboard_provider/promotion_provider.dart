import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/services/rest_api/api_error.dart';

import '../../services/rest_api/api.dart';
import '../../services/rest_api/api_error_type.dart';
import '../../utils/promotion_util.dart';

class PromotionProvider extends ChangeNotifier with ApiError {
  String keyword = '';
  Map<String, String> filter = {};
  bool loading = false;
  List<PromotionUtil> _promotions = [];

  List<PromotionModel> get promotions =>
      _promotions.map((e) => PromotionModel.fromUtil(e)).toList();

  List<String> headers = [
    "ID",
    'PARTNER',
    'TITLE',
    'APPLY TO',
    'COUPON',
    'COST',
    'STATUS',
    'ACTION'
  ];

  List<int> rates = [3, 2, 3, 2, 1, 1, 2, 2];

  void loadPromotions(BuildContext context) async {
    await apiCallSafety(
      () => Api().getDioNotAuthor("promotion/admin/all", {}, context),
      onStart: () async {
        loading = true;
      },
      onCompleted: (bool? status, dynamic res) async {
        loading = false;
        if (status != null && status && res != null) {
          if (res["data"] != null && res['data'] is List) {
            _promotions = (res['data'] as List)
                .map((e) => PromotionUtil.fromJson(e))
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

  @override
  Future<int> onApiError(error) {
    throw UnimplementedError();
  }

  void onSearch(BuildContext context, String text) {}
}
