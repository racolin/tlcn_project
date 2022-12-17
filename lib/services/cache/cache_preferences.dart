import 'package:shared_preferences/shared_preferences.dart';
import 'cache.dart';

/// Implement Storage by SharedPreferences
class CachePreferences extends Cache with NPreferences {}

/// This class for local storage using SharedPreferences
class NPreferences {
  // Create new Future ref to SharedPreferences instance
  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  /// Save data with primary data types: String, List<String>, double, int, bool
  Future<bool> saveData<T>( String key, T value) async {
    // Get SharedPreferences ref
    final SharedPreferences ref = await preferences;

    // Delete if value is null
    if (value == null) {
      return ref.remove(key);
    }

    // With primary data type, save to local
    if (value is String) {
      return ref.setString(key, value);
    } else if (value is bool) {
      return ref.setBool(key, value);
    } else if (value is int) {
      return ref.setInt(key, value);
    } else if (value is double) {
      return ref.setDouble(key, value);
    } else if (value is List<String>) {
      return ref.setStringList(key, value);
    }
    // Default return false
    return false;
  }

  // Get data by key
  Future<T> getData<T>(String key) async {
    // Get SharedPreferences ref
    final SharedPreferences ref = await preferences;
    // Get data by key with cast to output data type
    return ref.get(key).toString() as T;
  }
  // Clear all
  Future<bool> clear() async {
    // Get SharedPreferences ref
    final SharedPreferences ref = await preferences;
    // Clear all data
    return ref.clear();
  }

}