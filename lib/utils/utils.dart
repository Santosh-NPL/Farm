import 'package:farm/resources/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils{
  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        textColor: AppColor.white,
        backgroundColor: AppColor.mainColor,
        gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static toastMessageCenter(String message){
    Fluttertoast.showToast(
      msg: message,
      textColor: AppColor.white,
      backgroundColor: AppColor.mainColor,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static snackBar(String title, String message){
    Get.snackbar(
      title,
      message,
    );
  }


  static bool isEmailValid(String email) {
    // You can use a regular expression for a simple email format check
    // Modify the regular expression based on your email validation requirements
    final emailRegExp = RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  static void verifyEmail(String email) {
    if (isEmailValid(email)) {
      toastMessage('Email is valid!');
      // You can add further logic here, such as sending a verification email.
    } else {
      toastMessage('Invalid email format. Please enter a valid email.');
    }
  }


}