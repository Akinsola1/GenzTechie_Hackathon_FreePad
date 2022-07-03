import 'package:flutter/material.dart';
import 'package:free_pad/api/data_models/auth_response/login_response.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';
import 'package:free_pad/api/Authentication_api/authentication_api.dart';
import 'package:free_pad/api/api_utils/network_exception.dart';
import 'package:free_pad/api/data_models/api_response.dart';
import 'package:free_pad/api/data_models/auth_response/getUser_response.dart';
import 'package:free_pad/locator.dart';
import 'package:get/get.dart';

import 'package:free_pad/ui/responsive_state/base_view_model.dart';
import 'package:free_pad/ui/responsive_state/view_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends BaseNotifier {
  var authApi = locator<AuthenticationApi>();
    UserResponse profile = UserResponse( );


  Future<LoginResponse> login(String email, String password) async {
    setState(ViewState.Busy);
    LoginResponse res = LoginResponse();

    try {
      print("commencing login");
      res = await authApi.login(email: email, password: password);
      setState(ViewState.Idle);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", res.data!.token!);
      return res;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayError(error: 'An Error occured!', message: '${e}');
    }
    setState(ViewState.Idle);

    return res;
  }

  Future<bool> signUp(
      String first_name,
      String last_name,
      String email,
      String password,
      String category,
      String phone,
      String city,
      String state,
      String pharmacy) async {
    setState(ViewState.Busy);
    print('commencing signup');

    try {
      ApiResponse res = await authApi.signUp(
          first_name: first_name,
          last_name: last_name,
          email: email,
          password: password,
          category: category,
          phone: phone,
          city: city,
          state: state,
          pharmacy: pharmacy);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", res.data!['token']);
      setState(ViewState.Idle);

      displayError(
          error: 'Account created successfully',
          message: 'Login to get started');
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (error) {
      print(error);
      displayError(error: 'An Error occurred!', message: '${error}');
    }
    setState(ViewState.Idle);

    return false;
  }

  SnackbarController displayError(
      {required String error, required String message}) {
    SnackbarController controller = Get.snackbar(
      error,
      message,
      maxWidth: 300,
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: Colors.black.withOpacity(0.5),
    );
    return controller;
  }
}
