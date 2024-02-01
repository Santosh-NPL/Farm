import 'package:farm/resources/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../repo/login_repo/login_repo.dart';
import '../../utils/utils.dart';

class MobileRegisterController  extends GetxController{

  final mobileController = TextEditingController().obs;

  final _api = LoginRepo();

  RxBool loading = false.obs;

  void mobileApi(){
    loading.value = true;

    Map data = {
      'mobile' : mobileController.value.text,
    };

    _api.mobileApi(data).then((value){
      loading.value = false;

      Get.offNamed(RouteName.otpScreen, arguments: mobileController.value.text);

    }).onError((error, stackTrace){
      loading.value = false;
      Utils.snackBar('error'.tr, error.toString());
    });
  }
}