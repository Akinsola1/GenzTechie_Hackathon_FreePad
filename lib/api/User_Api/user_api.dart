import 'package:free_pad/api/data_models/api_response.dart';
import 'package:free_pad/api/data_models/auth_response/getUser_response.dart';
import 'package:free_pad/api/data_models/auth_response/login_response.dart';
import 'package:free_pad/api/data_models/request/createRequest_response.dart';
import 'package:free_pad/api/data_models/request/request_response.dart';

abstract class UserApi {
  
  Future<UserResponse> getUserData();
  Future<List<RequestResponse>> getDOnationRequest();
  Future<MakeRequestResponse> makeDonationRequest();


} 