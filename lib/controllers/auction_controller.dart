import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:greenery/api/data/end_points.dart';
import 'package:greenery/models/auction_model/auction_model.dart';
import 'package:greenery/models/bid_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuctionController extends GetxController {
  final dio = Dio();
  RxBool isLoading = false.obs;
  RxBool isLoadingLive = false.obs;
  RxBool isLoadingUpcoming = false.obs;

  RxList<AuctionModel> liveAuctionsList = <AuctionModel>[].obs;
  RxList<AuctionModel> upcomingAuctionsList = <AuctionModel>[].obs;
  RxList<BidModel> bids = <BidModel>[].obs;

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

  Future getBids(String auctionId) async {
    try {
      isLoading.value = true;
      final String url = "$baseUrl${EndPoints.bid}/$auctionId";
      log(url.toString());
      print(url.toString());
      final result = await dio.get(url);
      if (result.statusCode == 200 && result.data != null) {
        final data = result.data;
        bids.value = (data['bids'] as List<dynamic>)
            .map((bid) => BidModel.fromJson(bid as Map<String, dynamic>))
            .toList();
        log(" bids: ${bids[0]}");
      } else {
        isLoading.value = false;
        throw Exception(
            'Failed to get Upcoming auctions: ${result.statusCode}, Message: ${result.statusMessage}');
      }
    } catch (e) {
      log('Error occurred while fetching bids: $e');
      throw Exception('Error fetching bids: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
