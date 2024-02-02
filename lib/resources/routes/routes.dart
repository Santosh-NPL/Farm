import 'package:farm/resources/routes/routes_name.dart';
import 'package:farm/view/dashboard/dashboard_screen.dart';
import 'package:farm/view/login/login_screen.dart';
import 'package:farm/view/signup/mobile_screen.dart';
import 'package:farm/view/signup/otp_screen.dart';
import 'package:farm/view/signup/signup_screen.dart';
import 'package:farm/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
        name: RouteName.splashScreen,
        page: () => SplashScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RouteName.loginScreen,
        page: () => LoginScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RouteName.mobileScreen,
        page: () => MobileScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RouteName.otpScreen,
        page: () => OTPScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RouteName.signupScreen,
        page: () => SignupScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.rightToLeftWithFade),

    GetPage(
        name: RouteName.dashboardScreen,
        page: () => DashboardScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.fadeIn),


          ];
}
