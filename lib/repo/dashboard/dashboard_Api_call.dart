
import 'package:farm/data/network/network_api_services.dart';
import 'package:farm/models/user_model/UserProfileJsonToDart.dart';
import 'package:farm/resources/app_url/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardAPICall{

  final _apiService = NetworkApiService();


  Future<UserProfileJsonToDart> userProfileApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    dynamic response = await _apiService.fetchApi(AppUrl.userProfile, token!);
    return UserProfileJsonToDart.fromJson(response);
  }

}