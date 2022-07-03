import 'package:free_pad/api/data_models/auth_response/getUser_response.dart';
import 'package:free_pad/api/data_models/auth_response/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../locator.dart';
import '../api_utils/api_helper.dart';
import '../api_utils/api_routes.dart';
import '../data_models/api_response.dart';

import 'authentication_api.dart';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';

class AuthenticationApiImpl implements AuthenticationApi {
  Map<String, String> get header => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        //'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };

  Map<String, String> get mediaHeader => {
        'Accept': 'application/json',
        // 'Content-Type': 'application/json',
        //'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };
  // Map<String, String> get authHeader => {
  //       'Accept': 'application/json',
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer ${}',
  //     };
  var server = locator<API>();

  @override
  Future<LoginResponse> login({String? email, String? password}) async {
    Map val = {
      "email": email,
      "password": password,
    };
    var responsebody = await server.post(ApiRoutes.login, header, jsonEncode(val));
    LoginResponse response = loginResponseFromJson(responsebody);
    return response;
  }

  @override
  Future<UserResponse> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var responsebody = await server.get(
      ApiRoutes.userProfile,
      {
        'Accept': 'application/json',
        'Authorization': 'Token ${token}',
      },
    );
    UserResponse response = userResponseFromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> signUp(
      {String? first_name,
      String? last_name,
      String? email,
      String? password,
      String? category,
      String? phone,
      String? city,
      String? state,
      String? pharmacy}) async {
    Map val = {
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "password": password,
      "category": category,
      "phone": phone,
      "city": city,
      "state": state,
      "pharmacy": pharmacy,
    };
    var responsebody = await server.post(ApiRoutes.signUp, header, jsonEncode(val));
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }
}

// String? first_name,
//     String? last_name,
//     String? email,
//     String? password,
//     String? category,
//     String? phoneNumber,
//     String? city,
//     String? state,
//     String? pharmacy,

