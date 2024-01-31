import 'package:farm/resources/routes/routes_name.dart';
import 'package:farm/view/login/login_screen.dart';
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
          ];
}
