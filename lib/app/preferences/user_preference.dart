import 'dart:convert';

import 'package:farm/models/user_model/LoginUserJsonToDart.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference{

  Future<void> saveUser(LoginUserJsonToDart user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', user.data!.token.toString());
    String userJson = jsonEncode(user); // convert user data to json string

    await prefs.setString('user_data', userJson);
    await prefs.setString('userName', user.data!.user!.profile!.name.toString());
    await prefs.setStringList('userRoles', user.data!.roles!.toList());
    await prefs.setString('token', user.data!.token.toString());
    await prefs.setString('id', user.data!.user!.id.toString());

  }

  Future<LoginUserJsonToDart?> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userJson = sp.getString('user_data');
    String? token = sp.getString('token');

    if (userJson != null) {
      if (kDebugMode) {
        print(userJson.toString());
      }
      return LoginUserJsonToDart.fromJson(jsonDecode(userJson));
    } else {
      if (kDebugMode) {
        print("User not found...");
      }
      return null; // Return null when user data is not found
    }
  }


  Future<void> removeUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_data');
    await prefs.remove('token');
    await prefs.clear();
  }

}