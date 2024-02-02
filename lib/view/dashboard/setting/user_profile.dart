import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:farm/resources/app_color.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: AppColor.mainColor,
        borderRadius: BorderRadius.circular(isDrawerOpen? 20: 0),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 25),
        child: Scaffold(
          backgroundColor: AppColor.mainColor,
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: AppColor.mainColor,
            color: AppColor.buttonColor,
            onTap: (index){
              print(index);
            },
            items: [
              Icon(Icons.home),
              Icon(Icons.dashboard),
              Icon(Icons.favorite),
              Icon(Icons.settings),
              Icon(Icons.verified_user),

            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isDrawerOpen? IconButton(onPressed: (){

                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isDrawerOpen = false;
                      });
                    }, icon: Icon(Icons.arrow_back_ios)) : IconButton(
                        onPressed: () {
                          setState(() {
                            xOffset = 230;
                            yOffset = 150;
                            scaleFactor = 0.6;
                            isDrawerOpen = true;
                          });
                        },
                        icon: Icon(Icons.menu)),
                    Column(
                      children: [
                        Text("Location"),
                        Text("Chitwan"),
                      ],
                    ),
                    CircleAvatar(
                      radius: 20,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/icon.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
