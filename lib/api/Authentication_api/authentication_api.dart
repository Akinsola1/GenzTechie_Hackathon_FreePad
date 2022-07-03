import 'package:free_pad/api/data_models/api_response.dart';
import 'package:free_pad/api/data_models/auth_response/getUser_response.dart';
import 'package:free_pad/api/data_models/auth_response/login_response.dart';

abstract class AuthenticationApi {
   Future<LoginResponse> login({
    String email,
    String password,
  });

   Future<ApiResponse> signUp({
    String first_name,
    String last_name,
    String email,
    String password,
    String category,
    String phone,
    String city,
    String state,
    String pharmacy,
  });

} 