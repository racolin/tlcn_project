import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:tlcn_project/models/user_model.dart';
import '../../services/cache/cache.dart';
import '../../services/rest_api/api.dart';
import '../../services/rest_api/api_error.dart';
import 'package:provider/provider.dart';

class AuthProvider extends ChangeNotifier with ApiError {
  final int _otpCount = 120;

  int get otpCount => _otpCount;

  Future<bool> login({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    bool success = true;
    await apiCallSafety(
      () => Api().postDioNotAuthor(
          "auth/admin/login",
          {
            "username": username,
            "password": password,
          },
          null),
      onStart: () async {},
      onCompleted: (bool? status, dynamic res) async {
        if (status != null && status && res != null) {
          var provider = context.read<Cache>();
          await provider.saveData(
                'access_token',
                res['data']['access_token'],
              );
          await provider.saveData(
              'refresh_token',
              res['data']['refresh_token'],
            );
          await provider.saveData(
                'username',
                username,
              );
          await provider.saveData(
                'avatar',
                'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o=',
              );
        }
      },
      onError: (dynamic error) async {
        success = false;
      },
      skipOnError: true,
    );
    return success;
  }

  Future<bool> existToken(BuildContext context) async {
    String? accessToken = await context.read<Cache>().getData("access_token");
    return accessToken != null && accessToken != "" && accessToken != 'null';
  }

  // Future<bool> refreshToken(BuildContext context) async {
  //   bool isRefresh = false;
  //   await apiCallSafety(
  //         () => Api()
  //         .getDioNotAuthor("account/refesh-token?oldToken=$token", {}, context),
  //     onStart: () async {},
  //     onCompleted: (bool? status, dynamic res) async {
  //       if (status != null && status && res != null) {
  //         final bool saveRes = await _credential.storeCredential(Token(
  //           accessToken: res["data"]["access_token"],
  //           refreshToken: "",
  //         ));
  //         if (saveRes) {
  //           isRefresh = true;
  //         }
  //       }
  //     },
  //     onError: (dynamic error) async {
  //       isRefresh = false;
  //     },
  //     skipOnError: true,
  //   );
  //
  //   return isRefresh;
  // }

  Future<bool> logout(BuildContext context) async {
    return context.read<Cache>().saveData('access_token', '');
  }

  @override
  Future<int> onApiError(error) {
    throw UnimplementedError();
  }
}
