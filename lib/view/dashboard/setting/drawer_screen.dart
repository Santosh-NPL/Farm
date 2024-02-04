import 'package:farm/resources/app_color.dart';
import 'package:farm/view/dashboard/setting/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../app/controller/dashboard/dashboard_controller.dart';
import '../../../data/response/status.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final dashboardCtrl = Get.put(DashboardController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dashboardCtrl.userProfileApi();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Obx(() {
          switch (dashboardCtrl.rxRequestStatus.value) {
            case Status.LOADING:
              return Center(
                child: CircularProgressIndicator(),
              );
            case Status.ERROR:
              return Text('Something went wrong');
            case Status.COMPLETED:
              final userProfile = dashboardCtrl.userProfile.value;
              return Container(
                color: AppColor.secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, bottom: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(userProfile.data?.user?.profile!.name ?? '',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColor.white,
                                      fontWeight: FontWeight.bold)
                              ),
                              Icon(Icons.check_circle, color: Colors.green),
                              Text('Active Status',
                                  style: TextStyle(color: AppColor.white)),
                            ],
                          )
                        ],
                      ),

                      Column(
                        children: drawerItems.map((element) =>
                        Padding(padding: EdgeInsets.only(bottom: 30),
                          child: Row(
                            children: [
                              Icon(element['icon'], size: 20,
                                color: AppColor.checkColor,),
                              SizedBox(width: 10,),
                              Text(element['title'], style: TextStyle(
                                  fontSize: 15, color: AppColor.white),)
                            ],
                          ),
                        )
                        ).toList(),
                      ),
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.cog, color: AppColor.checkColor,),
                          SizedBox(width: 10,),
                          Text('setting'.tr,
                              style: TextStyle(fontSize: 20,
                                  color: AppColor.white,
                                  fontWeight: FontWeight.bold)
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 2, height: 20, color: AppColor.mainColor,
                          ),
                          SizedBox(width: 10,),
                          InkWell(
                              onTap: () {

                              },
                              child: Text("log_out".tr, style: TextStyle(
                                  fontSize: 20,
                                  color: AppColor.white,
                                  fontWeight: FontWeight.bold)))
                        ],
                      )
                    ],
                  ),
                ),
              );
          }

          return SizedBox();
        }),
      ),
    );
  }
}
