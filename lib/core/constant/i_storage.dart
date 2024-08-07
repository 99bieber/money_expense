import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IStorage {
  IStorage._();

  static dynamic setValue(dynamic key, dynamic value) {
    if (value is String) {
      instance.then((pref) {
        pref.setString(key, value);
      });
      return;
    }
    if (value is bool) {
      instance.then((pref) {
        pref.setBool(key, value);
      });
      return;
    }
    if (value is double) {
      instance.then((pref) {
        pref.setDouble(key, value);
      });
      return;
    }
    if (value is int) {
      instance.then((pref) {
        pref.setInt(key, value);
      });
      return;
    }
  }

  static Future<SharedPreferences> get instance async {
    var pref = await SharedPreferences.getInstance();
    return pref;
  }

  static Future<bool> removeKey(String key) async {
    var pref = await instance;
    return await pref.remove(key);
  }

  static Future<dynamic> getValue(dynamic key) async {
    var pref = await SharedPreferences.getInstance();
    if (pref.containsKey(key)) {
      var value = pref.get(key);
      if (value is bool) {
        return value;
      } else if (value is int) {
        return value;
      } else if (value is double) {
        return value;
      } else if (value is String) {
        return value;
      } else if (value is List<String>) {
        return value;
      } else {
        // Handle unknown types or return a default value
        return null;
      }
    } else {
      // Handle the case where the key does not exist
      return null;
    }
  }

  static Future<bool> setString(dynamic key, String? value) async {
    var pref = await SharedPreferences.getInstance();
    if (value == null) {
      return false;
    }
    var success = await pref.setString(key, value);
    if (kDebugMode) {
      print("Saving $key is $success");
    }
    return success;
  }

  static Future<String> getString(dynamic key) async {
    var pref = await SharedPreferences.getInstance();
    var val = pref.getString(key);
    if (val == null) {
      return "";
    }
    return val;
  }
}
