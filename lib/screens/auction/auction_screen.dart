import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:greenery/controllers/app_controller.dart';
import 'package:greenery/screens/widgets/custom_elevated_button.dart';

import '../widgets/custom_appbar_widget.dart';

class AuctionScreen extends StatelessWidget {
  const AuctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.put(AppController());

    return Scaffold(
      appBar: CustomAppBarWidget(
        title: "Auction",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Obx(
              () {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomElevatedButton(
                      height: 50.w,
                      width: 170.w,
                      onPressed: () {
                        appController.auctionButtonSelectedIndex.value = 0;
                      },
                      backgroundColor:
                          appController.auctionButtonSelectedIndex.value == 0
                              ? const Color(0xff75E6A3)
                              : const Color(0xff75E6A3).withOpacity(0.2),
                      label: "Participated",
                      labelColor: Colors.black,
                      labelSize: 16.sp,
                      border:
                          appController.auctionButtonSelectedIndex.value == 0
                              ? Border.all(
                                  width: 1,
                                )
                              : null,
                    ),
                    CustomElevatedButton(
                      height: 50.w,
                      width: 170.w,
                      onPressed: () {
                        appController.auctionButtonSelectedIndex.value = 1;
                      },
                      backgroundColor:
                          appController.auctionButtonSelectedIndex.value == 1
                              ? const Color(0xff75E6A3)
                              : const Color(0xff75E6A3).withOpacity(0.2),
                      label: "My Auctions",
                      labelColor: Colors.black,
                      labelSize: 16.sp,
                      border:
                          appController.auctionButtonSelectedIndex.value == 1
                              ? Border.all(
                                  width: 1,
                                )
                              : null,
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset("assets/auction/sorting_arrows.png"),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "select an option to sort bids",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Image.asset("assets/auction/forward.png"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return const ProductListingWidget(
                    productName: "Product Name",
                    description:
                        "Lorem ipsum dolor sit amet consectetur. Adipiscing quis quisque condimentum........",
                    currentHighestBid: 400,
                    winningBidAmount: 300,
                    hoursRemaining: 12,
                    minutesRemaining: 12,
                    secondsRemaining: 23,
                    isLive: false,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductListingWidget extends StatelessWidget {
  final String productName;
  final String description;
  final double currentHighestBid;
  final double winningBidAmount;
  final int hoursRemaining;
  final int minutesRemaining;
  final int secondsRemaining;
  final bool isLive;

  const ProductListingWidget({
    super.key,
    required this.productName,
    required this.description,
    required this.currentHighestBid,
    required this.winningBidAmount,
    required this.hoursRemaining,
    required this.minutesRemaining,
    required this.secondsRemaining,
    required this.isLive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.w,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            child: Image.asset(
              'assets/products/productImage.png',
              height: 130.w,
              width: 130.w,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 180.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.green,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Live",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 180.w,
                  child: Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color.fromRGBO(
                        0,
                        0,
                        0,
                        0.6,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Current highest bid: ',
                      style: TextStyle(
                        fontSize: 14.w,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      currentHighestBid.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 16.w,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
