// ignore_for_file: use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/models/user_model.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/route_configuration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserDataProvider extends ChangeNotifier {
  var _username = '';

  UserModel? userModel;

  bool isLoading = false;

  String get username => _username;

  Future<void> clearUserDataAsync() async {
    final sharedPref = await SharedPreferences.getInstance();

    await sharedPref.remove("username");

    _username = '';

    notifyListeners();
  }

  getUserData() async {
    isLoading = true;
    PostgrestResponse response = await supabase
        .from('userdata')
        .select('*', const FetchOptions(forceResponse: true))
        .eq('id', 1);

    if (response.status == 200) {
      userModel = UserModel.fromJson(response.data[0]);
    } else {}
    isLoading = false;
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
    required BuildContext context,
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
      GoRouter.of(context).go(RouteUri.admin);
      notifyListeners();
    }
  }
}
