import 'dart:async';

import 'package:farm/resources/routes/routes_name.dart';
import 'package:farm/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../repo/login_repo/login_repo.dart';

class OTPController  extends GetxController{

  final _api = LoginRepo();

  final mobileNumber = TextEditingController().obs;
  final oneController = TextEditingController().obs;
  final twoController = TextEditingController().obs;
  final threeController = TextEditingController().obs;
  final fourController = TextEditingController().obs;

  RxBool loading = false.obs;
  RxBool loadingResend = false.obs;
  RxInt remainingTime = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    mobileNumber.value.text = Get.arguments;

    super.onInit();
  }
  void otpApi(){
      loading.value = true;

      Map data = {
        'mobile': mobileNumber.value.text,
        'otp': oneController.value.text+twoController.value.text+threeController.value.text+fourController.value.text
      };

      _api.otpApi(data).then((value){
        loading.value = false;

        Get.offNamed(RouteName.signupScreen, arguments: mobileNumber.value.text);

      }).onError((error, stackTrace){
        loading.value = false;
        Utils.snackBar('error'.tr, error.toString());
      });



  }

  void requestNewCode(){
    loadingResend.value = true;
    Map data = {
      'mobile' : mobileNumber.value.text,
    };

    _api.mobileApi(data).then((value){
      loadingResend.value = false;


      Utils.snackBar('success'.tr, 'New OTP send to: ${mobileNumber.value.text}');
      // Start a timer for a 2-minute cooldown
      remainingTime.value = 120; // Set the initial remaining time in seconds

      Timer.periodic(Duration(seconds: 1), (timer) {
        if (remainingTime.value > 0) {
          remainingTime.value--;
        } else {
          timer.cancel();
          loadingResend.value = false;
        }
      });

    }).onError((error, stackTrace){
      loadingResend.value = false;
      Utils.snackBar('error'.tr, error.toString());
    });

  }


}