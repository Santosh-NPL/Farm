import 'package:farm/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          color: AppColor.buttonColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Column(
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

                Row(
                  children: [
                    Icon(FontAwesomeIcons.cog, color: AppColor.mainText,),
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
