import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/services/rest_api/api_error.dart';
import 'package:tlcn_project/utils/coupon_util.dart';

import '../../services/rest_api/api.dart';
import '../../services/rest_api/api_error_type.dart';

class CouponProvider extends ChangeNotifier with ApiError {
  String keyword = '';
  Map<String, String> filter = {};
  bool loading = false;
  List<CouponUtil> _coupons = [];
  List<String> headers = [
  "ID",
  'CODE',
  'IMAGE',
  'TITLE',
  'APPLIED TIME',
  'ACTION'
  ];

  List<int> rates = [2, 1, 1, 3, 1, 2];

  List<CouponModel> get coupons => _coupons.map((e) => CouponModel.fromUtil(e)).toList();

  void loadCoupons(BuildContext context) async {
    await apiCallSafety(
          () => Api().getDioNotAuthor("coupon/admin/all", {}, context),
      onStart: () async {
        loading = true;
      },
      onCompleted: (bool? status, dynamic res) async {
        loading = false;
        if (status != null && status && res != null) {
          if (res["data"] != null && res['data'] is List) {
            _coupons = (res['data'] as List)
                .map((e) => CouponUtil.fromJson(e))
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
    // TODO: implement onApiError
    throw UnimplementedError();
  }

  void onSearch(BuildContext context, String text) {}
}