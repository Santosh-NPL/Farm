import 'package:farm/resources/app_color.dart';
import 'package:farm/view/dashboard/setting/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          color: AppColor.secondaryColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Santosh Neupane',
                          style: TextStyle(fontSize: 20, color: AppColor.white, fontWeight: FontWeight.bold),
                        ),

                        Text('Active Status', style: TextStyle(color: AppColor.white)),
                      ],
                    )
                  ],
                ),

                Column(
                  children: drawerItems.map((element) =>
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      children: [
                        Icon(element['icon'], size: 20, color: AppColor.menuIcon,),
                        SizedBox(width: 10,),
                        Text(element['title'], style: TextStyle(fontSize: 15, color: AppColor.white),)
                      ],
                    ),
                  )
                  ).toList(),
                ),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.cog, color: AppColor.menuSecondIcon,),
                    SizedBox(width: 10,),
                    Text('setting'.tr,
                        style: TextStyle(fontSize: 20, color: AppColor.white, fontWeight: FontWeight.bold)
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 2, height: 20, color: AppColor.mainColor,
                    ),
                    SizedBox(width: 10,),
                    Text("log_out".tr, style: TextStyle(fontSize: 20, color: AppColor.white, fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
