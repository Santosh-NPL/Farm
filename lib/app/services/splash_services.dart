import 'dart:async';

import 'package:farm/app/preferences/user_preference.dart';
import 'package:farm/resources/app_url/app_url.dart';
import 'package:farm/resources/routes/routes_name.dart';
import 'package:get/get.dart';

import '../../data/network/network_api_services.dart';


class SplashServices{

  UserPreference userPreference = UserPreference();
  final _api = NetworkApiService();

  void isLogin() {
    userPreference.getUser().then((value) {
      if (value == null) {
        Timer(const Duration(seconds: 3), () => Get.offNamed(RouteName.loginScreen));
      } else {
        // Check if the user has the "farmer" role
        List<String>? userRoles = value.data?.roles;
        String? token = value.data?.token;

        if (userRoles != null && userRoles.contains("farmer")) {
          // User has the "farmer" role, navigate to the dashboard screen
          Timer(const Duration(seconds: 3), () => Get.offNamed(RouteName.dashboardScreen));
        } else {
          // User doesn't have the "farmer" role, log them out and redirect to the login screen
          _api.logoutApi(AppUrl.logoutUser, token);

          userPreference.removeUser();
          Timer(const Duration(seconds: 3), () => Get.offNamed(RouteName.loginScreen));
        }
      }
    });
  }

}
