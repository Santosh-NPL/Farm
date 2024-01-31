import 'package:farm/app/services/splash_services.dart';
import 'package:farm/resources/app_color.dart';
import 'package:farm/resources/components/internet_exception_widget.dart';
import 'package:farm/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashServices = SplashServices();

  @override
void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor, // Change the color as needed
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your app logo or image here
            // Example:
            Image.asset('assets/images/logo.png', width: 150, height: 200),
            SizedBox(height: 16),
            // Add your app name or slogan
            // Example:
            Text(
              'Farm Demo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
