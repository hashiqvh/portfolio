import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider extends ChangeNotifier {
  var _username = '';

  String get username => _username;

  Future<void> clearUserDataAsync() async {
    final sharedPref = await SharedPreferences.getInstance();

    await sharedPref.remove("username");

    _username = '';

    notifyListeners();
  }

  bool isUserLoggedIn() {
    return _username.isNotEmpty;
  }

  Future<void> loadAsync() async {
    final sharedPref = await SharedPreferences.getInstance();

    _username = sharedPref.getString("username") ?? '';

    notifyListeners();
  }

  Future<void> setUserDataAsync({
    String? username,
  }) async {
    final sharedPref = await SharedPreferences.getInstance();
    var shouldNotify = false;

    if (username != null && username != _username) {
      _username = username;

      await sharedPref.setString("username", _username);

      shouldNotify = true;
    }

    if (shouldNotify) {
      notifyListeners();
    }
  }
}
