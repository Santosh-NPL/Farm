import 'dart:async';

import 'package:farm/resources/routes/routes_name.dart';
import 'package:get/get.dart';

import '../../view/login/login_screen.dart';

class SplashServices{
  void isLogin(){
      Timer(const Duration(seconds: 3), () => Get.offNamed(RouteName.loginScreen));
  }
}
