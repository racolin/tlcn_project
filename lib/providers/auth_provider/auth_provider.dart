import 'package:flutter/material.dart';
import 'package:tlcn_project/model/user_model.dart';
import 'package:tlcn_project/providers/auth_provider/shared_prefs_provider.dart';
import 'package:tlcn_project/util/auth_util.dart';

class AuthProvider extends ChangeNotifier {
  AuthUtil? authUtil = AuthUtil(
    'Phan Trung Tin',
    'password',
    null,
    'token',
    'refreshToken',
    'expire',
  );

  final SharedPreferencesProvider preferences;

  AuthProvider(this.preferences);

  bool get isAuth => authUtil != null;

  Future<bool> login(String username, String password) async {
    authUtil = AuthUtil(
      'Phan Trung Tin',
      'password',
      null,
      'token',
      'refreshToken',
      'expire',
    );
    notifyListeners();
    return true;
  }

  UserModel get user {
    return isAuth
        ? UserModel(username: authUtil!.username, avatar: authUtil!.avatarUrl)
        : UserModel(username: '', avatar: null);
  }

  Future<bool> logout() async {
    authUtil = null;
    notifyListeners();
    return true;
  }
}
