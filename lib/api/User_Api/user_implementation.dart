import 'package:free_pad/api/User_Api/user_api.dart';
import 'package:free_pad/api/data_models/auth_response/getUser_response.dart';
import 'package:free_pad/api/data_models/auth_response/login_response.dart';
import 'package:free_pad/api/data_models/request/createRequest_response.dart';
import 'package:free_pad/api/data_models/request/make_donation_response.dart';
import 'package:free_pad/api/data_models/request/request_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../locator.dart';
import '../api_utils/api_helper.dart';
import '../api_utils/api_routes.dart';
import '../data_models/api_response.dart';

import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';

class UserImplementation implements UserApi {
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
  Future<List<RequestResponse>> getDOnationRequest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var responsebody = await server.get(
      ApiRoutes.donateRequest,
      {
        'Accept': 'application/json',
        'Authorization': 'Token ${token}',
      },
    );
    var response = requestResponseFromJson(responsebody);
    return response;
  }

  @override
  Future<MakeRequestResponse> makeDonationRequest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var responsebody = await server.post(ApiRoutes.createRequest,
      {
        'Accept': 'application/json',
        'Authorization': 'Token ${token}',
      }, '');
    var response = makeRequestResponseFromJson(responsebody);
    return response;
  }

  @override
  Future<MakeDonation> makeDonation(int Id) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var responsebody = await server.get(
        'https://freepad.herokuapp.com/api/v1/donate/${Id}',
      {
        'Accept': 'application/json',
        'Authorization': 'Token ${token}',
      },
    );
    MakeDonation response = makeDonationFromJson(responsebody);
    return response;  // TODO: implement makeDonation
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

