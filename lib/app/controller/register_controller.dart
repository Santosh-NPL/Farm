import 'package:farm/repo/login_repo/login_repo.dart';
import 'package:farm/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../resources/routes/routes_name.dart';

class RegisterController extends GetxController{

  final mobileNumber = TextEditingController().obs;
  final token = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final _api = LoginRepo();
  RxBool loading = false.obs;
  RxBool isPasswordVisible = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    mobileNumber.value.text = Get.arguments[0];
    token.value.text = Get.arguments[1];

    super.onInit();
  }



  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  void registerFarmApi(){

    loading.value = true;

    Map data = {
      'token': token.value.text,
      'mobile' : mobileNumber.value.text,
      'name' : nameController.value.text,
      'password': passwordController.value.text,
    };

    _api.regiserFormApi(data).then((value){
      loading.value = false;

      Utils.snackBar("success".tr, "user create");
      Get.offAll(RouteName.loginScreen);


    }).onError((error, stackTrace){
      loading.value = false;
      Utils.snackBar('error'.tr, error.toString());
    });

  }




}