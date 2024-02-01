import 'dart:ffi';

import 'package:farm/app/controller/mobile_register_controller.dart';
import 'package:farm/resources/app_color.dart';

import 'package:farm/resources/components/round_button.dart';
import 'package:farm/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/routes/routes_name.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {


  final mobileCtrl = Get.put(MobileRegisterController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black54,
                    size: 32,
                  ),
                ),
              ),
              SizedBox(height: 18,),
              Container(
                width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColor.buttonColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                'assets/images/illustration-2.png',
                width: 240,
              )),
              SizedBox(
                height: 18,
              ),
              Text(
                "sign_up".tr,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text('add_mobile'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(12)
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('mobile'.tr, style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                          ),),
                          SizedBox(height: 5,),

                          TextFormField(
                            controller: mobileCtrl.mobileController.value,
                            validator: (value){
                              if(value!.isEmpty){
                                Utils.snackBar('mobile'.tr, 'Enter Mobile no.');
                                return 'Enter mobile no';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 18),
                            keyboardType: TextInputType.number,
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
                        ],
                      ),

                      // TextFormField(
                      //   keyboardType: TextInputType.number,
                      //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      //   decoration: InputDecoration(
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: AppColor.secondaryColor),
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: AppColor.secondaryColor),
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     prefix: Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: 8),
                      //       child: Text(
                      //         '(+९७७)',
                      //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Obx(() => RoundButton(
                  loading: mobileCtrl.loading.value,
                  title: 'send'.tr,
                  onPress: (){

                    // Get.snackbar("check", "message");

                    if(_formKey.currentState!.validate()){
                      mobileCtrl.mobileApi();
                    }
                  }
              )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
