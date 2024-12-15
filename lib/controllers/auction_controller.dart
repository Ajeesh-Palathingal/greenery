import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:greenery/api/data/end_points.dart';
import 'package:greenery/core/constants/constants.dart';
import 'package:greenery/models/auction_model/auction_model.dart';
import 'package:greenery/models/bid_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuctionController extends GetxController {
  final dio = Dio();
  RxBool isLoading = false.obs;

  RxList<AuctionModel> liveAuctionsList = <AuctionModel>[].obs;
  RxList<AuctionModel> upcomingAuctionsList = <AuctionModel>[].obs;
  RxList<BidModel> bidsList = <BidModel>[].obs;

  Future getLiveAuctions() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    try {
      isLoading.value = true;
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
        isLoading.value = false;

        return true;
      } else {
        // Handle unexpected status codes or null response
        isLoading.value = false;
        throw Exception(
            'Failed to get live auctions: ${result.statusCode}, Message: ${result.statusMessage}');
      }
    } catch (e) {
      isLoading.value = false;
      log('Error occurred during live auctions: $e');
    }
  }

  Future getUpcomingAuctions() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    try {
      isLoading.value = true;
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

        return true;
      } else {
        // Handle unexpected status codes or null response
        isLoading.value = false;
        throw Exception(
            'Failed to get Upcoming auctions: ${result.statusCode}, Message: ${result.statusMessage}');
      }
    } catch (e) {
      isLoading.value = false;
      log('Error occurred during upcoming auctions: $e');
    }
  }

  Future<void> getBids(String auctionId) async {
    try {
      log("getting bids");
      isLoading.value = true;
      final _sharedPref = await SharedPreferences.getInstance();
      final _token = _sharedPref.getString(TOKEN) ?? '';

      dio.options = BaseOptions(
        baseUrl: baseUrl,
        responseType: ResponseType.plain,
        validateStatus: (status) => status! < 500,
        headers: {
          "authorization": _token,
        },
      );

      final response = await dio.get("$baseUrl${EndPoints.bid}/$auctionId");

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.data)['bids'];
        List<BidModel> bid =
            data.map((json) => BidModel.fromJson(json)).toList();

        // Update the bids list in the controller
        bidsList.value = bid;
        log(bidsList.toString());
        isLoading.value = false;
      } else {
        print('Failed to load bids. Status Code: ${response.statusCode}');
        isLoading.value = false;
      }
    } catch (e) {
      print('Error occurred while fetching bids: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
