import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:greenery/api/data/end_points.dart';
import 'package:greenery/models/auction_model/auction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuctionController extends GetxController {
  final dio = Dio();
  RxBool isLoadingLive = false.obs;
  RxBool isLoadingUpcoming = false.obs;

  RxList<AuctionModel> liveAuctionsList = <AuctionModel>[].obs;
  RxList<AuctionModel> upcomingAuctionsList = <AuctionModel>[].obs;

  Future getLiveAuctions() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    try {
      isLoadingLive.value = true;
      final result = await dio.get(
        "$baseUrl${EndPoints.liveAuction}",
      );

      if (result.statusCode == 200 && result.data != null) {
        final data = result.data;
        liveAuctionsList.value = (data['liveAuctions'] as List<dynamic>)
            .map((auction) =>
                AuctionModel.fromJson(auction as Map<String, dynamic>))
            .toList();
        log("Live auctions: ${liveAuctionsList[0].productName}");
        isLoadingLive.value = false;

        return true;
      } else {
        // Handle unexpected status codes or null response
        isLoadingLive.value = false;
        throw Exception(
            'Failed to get live auctions: ${result.statusCode}, Message: ${result.statusMessage}');
      }
    } catch (e) {
      isLoadingLive.value = false;
      log('Error occurred during live auctions: $e');
    }
  }

  Future getUpcomingAuctions() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    try {
      isLoadingUpcoming.value = true;
      final result = await dio.get(
        "$baseUrl${EndPoints.upcomingAuction}",
      );

      if (result.statusCode == 200 && result.data != null) {
        final data = result.data;
        upcomingAuctionsList.value = (data['upcomingAuctions'] as List<dynamic>)
            .map((auction) =>
                AuctionModel.fromJson(auction as Map<String, dynamic>))
            .toList();
        log("Upcoming auctions: ${upcomingAuctionsList[0].productName}");
        isLoadingUpcoming.value = false;
        return true;
      } else {
        // Handle unexpected status codes or null response
        isLoadingUpcoming.value = false;
        throw Exception(
            'Failed to get Upcoming auctions: ${result.statusCode}, Message: ${result.statusMessage}');
      }
    } catch (e) {
      isLoadingUpcoming.value = false;
      log('Error occurred during upcoming auctions: $e');
    }
  }
}
