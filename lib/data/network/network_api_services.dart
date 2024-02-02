import 'dart:async';
import 'dart:convert';

import 'dart:io';

import 'package:farm/data/add_exceptions.dart';
import 'package:farm/data/network/base_api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkApiService extends BaseApiServices {

  Future<dynamic> logoutApi(String url, token) async{
    dynamic responseJson;
    final SharedPreferences preferences = await SharedPreferences.getInstance();


    // preferences.clear();

    try{
      final response = await http.post(Uri.parse(url), headers: {
        'Accept':'application/vnd.api+json',
        'Content-type': 'application/x-www-form-urlencoded',
        'Authorization' : 'Bearer $token'
      });
      print('Status code from logout bas api: '+ response.statusCode.toString());

      if(response.statusCode == 200){

        preferences.clear(); // Clear user data from SharedPreferences
        // Navigate to login screen

        Get.offAllNamed('/login_screen');
      }
      responseJson = returnResponse(response);

      return responseJson;


    }on SocketException{
      throw InternetException();
    }on RequestTimeOut{
      throw RequestTimeOut();
    }

  }


  @override
  Future<dynamic> getApi(String url) async{
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          // Add any additional headers as needed
        },
      ).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    }on SocketException{
      throw InternetException('');
    }on RequestTimeOut{
      throw RequestTimeOut();
    }
    return responseJson;
  }

  @override
  Future<dynamic> fetchApi(String url, String token) async{
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token', // Include the token in the request headers
          HttpHeaders.contentTypeHeader: 'application/json', // Specify content type as JSON
        },
      ).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    }on SocketException{
      throw InternetException('');
    }on RequestTimeOut{
      throw RequestTimeOut();
    }
    return responseJson;
  }

  @override
  Future<dynamic> fetchDataWithId(String baseUrl, String token, int id) async {
    dynamic responseJson;
    try {
      final url = Uri.parse('$baseUrl/$id'); // Append the id to the URL
      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json', // Specify content type as JSON
        },
      ).timeout(const Duration(seconds: 20));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('No Internet Connection');
    } on TimeoutException {
      throw RequestTimeOut('Request Timed Out');
    }
    return responseJson;
  }

  @override
  Future<dynamic> updateData(String baseUrl, String token, int id, Map<String, dynamic> updatedData) async {
    dynamic responseJson;
    try {
      final url = Uri.parse('$baseUrl/$id'); // Append the id to the URL
      final response = await http.patch( // Use http.patch for partial updates, or http.put for full updates
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json', // Specify content type as JSON
          // Add any other headers if needed
        },
        body: jsonEncode(updatedData), // Encode the updated data as JSON
      ).timeout(const Duration(seconds: 20));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('No Internet Connection');
    } on TimeoutException {
      throw RequestTimeOut('Request Timed Out');
    }
    return responseJson;
  }

 @override
  Future<dynamic> postApi(var data, String url) async {
    if(kDebugMode){
      print(url);
      print(data);
    }
   dynamic responseJson;
   try{
     final response = await http.post(Uri.parse(url),
     body: jsonEncode(data),
       headers: {
         'Content-Type': 'application/json',
         'Accept':'application/json',
         // Add any additional headers as needed
       },

     ).timeout(const Duration(seconds: 30));
     if(kDebugMode){
       print(response.statusCode.toString());

     }
     responseJson = returnResponse(response);
   }on SocketException{
     throw InternetException('');
   }on RequestTimeOut{
     throw RequestTimeOut();
   }
   return responseJson;
 }


  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 202:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 204:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequest(response.body);
      case 401:
        throw UnAuthorize(response.body);
      case 402:
        throw PaymentRequired(response.body);
      case 403:
        throw Forbidden(response.body);
      case 404:
        throw NotFound(response.body);
      case 408:
        throw RequestTimeOut(response.body);
      case 409:
        throw Conflict(response.body);
      case 422:
          throw UnProcessableEntity(response.body);
      case 500:
        throw InternalServerError(response.body);
      case 501:
        throw NotImplemented(response.body);
      case 502:
        throw BadGateway(response.body);
      case 503:
        throw ServiceUnavailable(response.body);
      case 504:
        throw GatewayTimeout(response.body);

        default:
          print('Unexpected Status Code: ${response.statusCode}');
          print('Response Body: ${response.body}');
          throw FetchDataError(response.body);
    }
  }
}