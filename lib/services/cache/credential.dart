import 'dart:convert';
import 'package:flutter/material.dart';

import '../../models/local/token.dart';
import 'cache.dart';

class Credential with ChangeNotifier {
  Credential(this._cache);

  /// PRIVATE PROPERTIES
  /// -----------------
  /// Local cache
  final Cache _cache;
  Token? _token;


  /// PUBLIC PROPERTIES
  /// -----------------
  /// Get user info
  Token? get token => _token;

  set token(Token? value) {
    _token = value;
    notifyListeners();
  }

  /// Load credential
  Future<bool> loadCredential() async {
    final String? tokenRaw = await _cache.getData<String>(Token.localKey);
    token = tokenRaw != null && tokenRaw !='null' ? Token.fromJson(json.decode(tokenRaw.toString()) as Map<String, dynamic>) : null;


    return token != null;
  }

  /// Store credential
  Future<bool> storeCredential(final Token newToken) async {
    final bool saveRes = await _cache.saveData(Token.localKey, jsonEncode(newToken.toJson()));
    await _cache.saveData(Token.tokenDate, DateTime.now().millisecondsSinceEpoch.toString());

    if (saveRes) {
      token = newToken;
    }
    return saveRes;
  }

  Future<bool> logout() async{
    _cache.clear();
    return true;
  }
}
