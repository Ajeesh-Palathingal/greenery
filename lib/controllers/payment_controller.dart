import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:greenery/api/data/end_points.dart';
import 'package:greenery/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentController extends GetxController {
  RxBool isLoading = false.obs;
  final dio = Dio();

  Future getOrderId(String auctionId) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    final token = await sharedPref.getString(TOKEN);
    log("$baseUrl${EndPoints.getOrderId}");
    log(auctionId);
    try {
      isLoading.value = true;
      final result = await dio.post(
        "$baseUrl${EndPoints.getOrderId}",
        data: {
          "auctionId": "675deff20f04919efc890539",
        },
        options: Options(
          headers: {
            'authorization': '$token',
          },
        ),
      );

      if (result.statusCode == 200 && result.data != null) {
        final data = result.data;

        log("Order id: $data");
        isLoading.value = false;

        return true;
      } else {
        // Handle unexpected status codes or null response
        isLoading.value = false;
        // throw Exception(
        //     'Failed to order id: ${result.statusCode}, Message: ${result.statusMessage}');
      }
    } on DioException catch (e) {
      isLoading.value = false;
      log('Error occurred during order id : ${e.message}');
      log('Error occurred during order id : ${e.response?.statusMessage}');
      log('Error occurred during order id : ${e.response?.data}');
    }
  }

  Future verifyPayment(
      String orderId, String signature, String paymentId) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    final token = await sharedPref.getString(TOKEN);
    log("$baseUrl${EndPoints.verify}");

    try {
      isLoading.value = true;
      final result = await dio.post(
        "$baseUrl${EndPoints.verify}",
        data: {
          "razorpayOrderId": orderId,
          "razorpaySignature": signature,
          "razorpayPaymentId": paymentId,
        },
        options: Options(
          headers: {
            'authorization': '$token',
          },
        ),
      );

      if (result.statusCode == 200 && result.data != null) {
        final data = result.data;

        log("Order id: $data");
        isLoading.value = false;

        return true;
      } else {
        // Handle unexpected status codes or null response
        isLoading.value = false;
        // throw Exception(
        //     'Failed to order id: ${result.statusCode}, Message: ${result.statusMessage}');
      }
    } on DioException catch (e) {
      isLoading.value = false;
      log('Error occurred during order id : ${e.message}');
      log('Error occurred during order id : ${e.response?.statusMessage}');
      log('Error occurred during order id : ${e.response?.data}');
    }
  }
}
