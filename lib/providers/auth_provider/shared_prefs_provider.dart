import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider {
  var preferences = SharedPreferences.getInstance();

  Future<bool> put<T>(String key, T value) async {
    final ref = await preferences;

    if (value == null) {
      return ref.remove(key);
    }

    if (value is bool) {
      return ref.setBool(key, value);
    } else if (value is int) {
      return ref.setInt(key, value);
    } else if (value is double) {
      return ref.setDouble(key, value);
    } else if (value is String) {
      return ref.setString(key, value);
    } else if (value is List<String>) {
      return ref.setStringList(key, value);
    }
    return false;
  }

  Future<T> get<T>(String key) async {

    final ref = await preferences;

    return ref.get(key) as T;
  }

  Future<bool> clear() async {
    final ref = await preferences;
    return ref.clear();
  }
}
