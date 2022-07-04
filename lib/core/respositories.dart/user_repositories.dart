import 'package:flutter/material.dart';
import 'package:free_pad/api/User_Api/user_api.dart';
import 'package:free_pad/api/data_models/auth_response/login_response.dart';
import 'package:free_pad/api/data_models/request/createRequest_response.dart';
import 'package:free_pad/api/data_models/request/request_response.dart';
import 'package:free_pad/constant/screen_routes.dart';
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

class UserProvider extends BaseNotifier {
  var userApi = locator<UserApi>();
  UserResponse profile = UserResponse();
  List<RequestResponse> donationRequest = [];

  Future<UserResponse> getUserData(context) async {
    setState(ViewState.Busy);

    try {
      profile = await userApi.getUserData();
      setState(ViewState.Idle);
      return profile;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      Navigator.pushNamed(context, RouteNames.login);
      displayError(error: 'An Error occurred!', message: '${e}');
    }
    setState(ViewState.Idle);

    return profile;
  }

  Future<List<RequestResponse>> getDOnationRequest() async {
    setState(ViewState.Busy);

    try {
      donationRequest = await userApi.getDOnationRequest();

      setState(ViewState.Idle);

      return donationRequest;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayError(error: 'An Error occurred!', message: '${e}');
    }
    setState(ViewState.Idle);

    return donationRequest;
  }

  Future<bool> makeDonationRequest() async {
    setState(ViewState.Busy);

    try {
      await userApi.makeDonationRequest();

      setState(ViewState.Idle);
      displayError(
          error: 'Donation request',
          message:
              'Request made successfully.You will be notified when your package arrive');
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      print(e);
      displayError(error: 'An Error occurred!', message: '${e}');
    }
    setState(ViewState.Idle);

    return false;
  }



  Future<bool> doDOnation(Id) async {
    setState(ViewState.Busy);

    try {
      await userApi.makeDonation(Id);

      setState(ViewState.Idle);
      displayError(
          error: 'Donation Made!',
          message:
              'Well done 👍');
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      print(e);
      displayError(error: 'An Error occurred!', message: '${e}');
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
