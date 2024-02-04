import 'package:farm/app/controller/register_controller.dart';
import 'package:farm/resources/app_color.dart';
import 'package:farm/resources/components/date_picker.dart';
import 'package:farm/resources/components/input_field.dart';
import 'package:farm/resources/components/round_button.dart';
import 'package:farm/resources/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isPasswordVisible = false;
  final regCtrl = Get.put(RegisterController());
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('english_full_name'.tr, style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                          ),),
                          SizedBox(height: 5,),
                          TextFormField(
                            controller: regCtrl.nameController.value,
                            validator: (value){
                              if(value!.isEmpty){
                                Utils.snackBar('name'.tr, 'Enter your name.');
                                return 'Enter Name';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.primaryColor),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.primaryColor),
                              ),
                            ),
                          ),

                          SizedBox(height: 20,),

                          Text('password'.tr, style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                          ),),
                          SizedBox(height: 5,),
                          TextFormField(
                            obscureText: !regCtrl.isPasswordVisible.value,
                            controller: regCtrl.passwordController.value,
                            validator: (value){
                              if(value!.isEmpty){
                                Utils.snackBar('name'.tr, 'Enter your password.');
                                return 'Enter Name';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.primaryColor),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.primaryColor),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    regCtrl.togglePasswordVisibility();
                                  });

                                },
                                child: Icon(
                                  regCtrl.isPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                          ),

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
                        ),
                      ),
                      child: Obx(()=>RoundButton(
                        loading: regCtrl.loading.value,
                        title: 'sign_up'.tr,
                        onPress: () {
                          regCtrl.registerFarmApi();
                        },
                        width: double.infinity,
                      )),
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
