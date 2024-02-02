

import 'package:farm/app/preferences/user_preference.dart';
import 'package:farm/models/user_model/LoginUserJsonToDart.dart';
import 'package:farm/repo/login_repo/login_repo.dart';
import 'package:farm/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../resources/routes/routes_name.dart';

class LoginController  extends GetxController{
  final _api = LoginRepo();

  UserPreference userPreference = UserPreference();

  final mobileController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool loading = false.obs;




  void loginAPi(){
    loading.value = true;

    Map data = {
      'mobile' : mobileController.value.text,
      'password': passwordController.value.text
    };

    _api.loginApi(data).then((value){
      loading.value = false;
      userPreference.saveUser(LoginUserJsonToDart.fromJson(value)).then((value){
        Get.offAllNamed(RouteName.dashboardScreen, arguments: [mobileController.value.text]);
      });

    }).onError((error, stackTrace){
    loading.value = false;
    Utils.snackBar('error'.tr, error.toString());
    });

  }

}