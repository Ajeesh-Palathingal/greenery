import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:greenery/api/data/end_points.dart';
import 'package:greenery/core/constants/constants.dart';
import 'package:greenery/models/messaged_profiles/messaged_profiles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final Dio dio = Dio();

  Future login(String email, String password) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    try {
      isLoading.value = true;
      final result = await dio.post(
        "$baseUrl${EndPoints.loginUser}",
        data: {
          'email': email,
          'password': password,
        },
      );

      if (result.statusCode == 200 && result.data != null) {
        final data = result.data;
        log("Login successful: ${data.toString()}");
        isLoading.value = false;
        log(data["token"].toString());
        sharedPref.setString(TOKEN, data["token"]);
        sharedPref.setString(NAME, data["user"]["fullName"]);
        sharedPref.setString(PROFILEPIC, data["user"]["profilePic"]);
        return true;
      } else {
        // Handle unexpected status codes or null response
        isLoading.value = false;
        throw Exception(
            'Failed to login: ${result.statusCode}, Message: ${result.statusMessage}');
      }
    } catch (e) {
      isLoading.value = false;
      log('Error occurred during login: $e');
    }
  }
}
