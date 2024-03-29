import 'package:farm/app/controller/login_controller.dart';
import 'package:farm/resources/app_color.dart';
import 'package:farm/resources/components/input_field.dart';
import 'package:farm/resources/components/round_button.dart';
import 'package:farm/resources/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final loginCtrl = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'login'.tr,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'login_to_your_account'.tr,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        InputFiles(label: "mobile".tr, controller: loginCtrl.mobileController.value,),
                        InputFiles(label: "password".tr, obscureText: true, controller: loginCtrl.passwordController.value,)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border(
                            bottom: BorderSide(color: AppColor.primaryColor),
                            top: BorderSide(color: AppColor.primaryColor),
                            left: BorderSide(color: AppColor.primaryColor),
                            right: BorderSide(color: AppColor.primaryColor),
                          )),
                      child: Obx(() => RoundButton(
                        loading: loginCtrl.loading.value,
                        title: 'login'.tr,
                        onPress: () {
                          if(_formKey.currentState!.validate()){
                            loginCtrl.loginAPi();

                          }
                        },
                        width: double.infinity,
                      )
                      )
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("dont_have_an_account".tr),
                    SizedBox(
                      width: 2,
                    ),
                    InkWell(
                      onTap: (){
                        Get.toNamed(RouteName.mobileScreen);
                      },
                      child: Text(
                        "sign_up".tr,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
