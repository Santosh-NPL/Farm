import 'package:farm/data/network/network_api_services.dart';
import 'package:farm/resources/app_url/app_url.dart';
import 'package:get/get.dart';

class LoginRepo{

  final _apiService = NetworkApiService();



  Future<dynamic> mobileApi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.mobileCheck);

      return response;
  }

  Future<dynamic> otpApi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.otpCheck);
    return response;
  }

  Future<dynamic> regiserFormApi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.farmRegister);
    return response;
  }

}