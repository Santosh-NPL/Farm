import 'package:farm/app/preferences/user_preference.dart';
import 'package:farm/data/response/status.dart';
import 'package:farm/models/user_model/UserProfileJsonToDart.dart';
import 'package:farm/repo/dashboard/dashboard_Api_call.dart';
import 'package:farm/repo/login_repo/login_repo.dart';
import 'package:farm/utils/utils.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController{

  final _api = DashboardAPICall();

  final rxRequestStatus = Status.LOADING.obs;
  final userProfile = UserProfileJsonToDart().obs;


  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserProfile(UserProfileJsonToDart _value) => userProfile.value = _value;


      void userProfileApi(){

          _api.userProfileApi().then((value){

            setRxRequestStatus(Status.COMPLETED);
            setUserProfile(value);

          }).onError((error, stackTrace){

            setRxRequestStatus(Status.ERROR);

          });

      }





}
