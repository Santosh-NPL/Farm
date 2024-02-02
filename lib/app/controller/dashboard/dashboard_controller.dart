import 'package:farm/app/preferences/user_preference.dart';
import 'package:farm/repo/dashboard/dashboard_Api_call.dart';
import 'package:farm/repo/login_repo/login_repo.dart';
import 'package:farm/utils/utils.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController{

  final _api = DashboardAPICall();
  UserPreference userPreference = UserPreference();

      void userProfileApi(){

          _api.userProfileApi().then((value){

            print(value);

          }).onError((error, stackTrace){

            Utils.snackBar('error'.tr, error.toString());

          });

      }





}
