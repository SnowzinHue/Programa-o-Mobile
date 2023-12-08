import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static const String _key = 'key';

  static save() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode({"isAccepted": true}));
  }

  static Future<bool> isAccepted() async {
    var prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getString(_key);
    if (jsonResult != null) {
      var mapUser = jsonDecode(jsonResult);
      return mapUser['isAccepted'];
    }

    return false;
  }
}
