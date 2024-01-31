import 'package:farm/resources/app_color.dart';
import 'package:farm/resources/components/date_picker.dart';
import 'package:farm/resources/components/input_field.dart';
import 'package:farm/resources/components/round_button.dart';
import 'package:farm/resources/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isPasswordVisible = false;

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
                        'sign_up'.tr,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      // Text(
                      //   'create_account'.tr,
                      //   style: TextStyle(
                      //     fontSize: 15,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        // InputFiles(label: "nepali_full_name".tr),
                        InputFiles(label: "english_full_name".tr),
                        InputFiles(label: "address".tr),
                        InputFiles(label: "mobile".tr, inputType: TextInputType.number,),
                        DatePickerWidget(label: 'dob'.tr,),
                        InputFiles(
                          label: "password".tr,
                          obscureText: !_isPasswordVisible,
                          suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            child: Icon(
                              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ],
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
                        ),
                      ),
                      child: RoundButton(
                        title: 'signup'.tr,
                        onPress: () {},
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("already_have_an_account".tr),
                      SizedBox(
                        width: 2,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(RouteName.loginScreen);
                        },
                        child: Text(
                          "login".tr,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
