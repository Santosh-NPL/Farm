class AppUrl{

  static const String baseUrl = 'http://192.168.1.33:2020/api';

  static const String loginUser = '$baseUrl/login';
  static const String logoutUser = '$baseUrl/logout';


  static const String mobileCheck = '$baseUrl/farm_reg';
  static const String otpCheck = '$baseUrl/farm_verify';
  static const String farmRegister = '$baseUrl/farm_register';

  // profile call

  static const String userProfile = '$baseUrl/userprofile';

}