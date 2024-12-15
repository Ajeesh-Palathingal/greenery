import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:greenery/api/data/end_points.dart';
import 'package:greenery/controllers/app_controller.dart';
import 'package:greenery/controllers/auction_controller.dart';
import 'package:greenery/controllers/payment_controller.dart';
import 'package:greenery/core/constants/api_endpoints.dart';
import 'package:greenery/core/constants/colors.dart';
import 'package:greenery/models/auction_model/auction_model.dart';
import 'package:greenery/models/bid_model.dart';
import 'package:greenery/screens/home/widgets/upcoming_tile.dart';
import 'package:greenery/screens/make_a_bid/make_a_bid.dart';
import 'package:greenery/screens/message_screen/ChatScreen.dart';
import 'package:greenery/screens/product_description/widgets/small_image_tile.dart';
import 'package:greenery/screens/widgets/custom_appbar_widget.dart';
import 'package:greenery/screens/widgets/custom_elevated_button.dart';
import 'package:greenery/screens/widgets/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.auction});

  final AuctionModel auction;
  PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.put(AppController());
    AuctionController auctionController = Get.put(AuctionController());
    final List imagesList = auction.images;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 333.w,
                        width: double.infinity,
                        child: Obx(() {
                          return Image(
                            image: NetworkImage(baseUrl +
                                imagesList[appController
                                    .selectedProductImageIndex.value]),
                            fit: BoxFit.cover,
                          );
                        }),
                      ),
                      Positioned(
                        bottom: 18.h,
                        left: 31.w,
                        right: 31.w,
                        child: Container(
                          height: 66.w,
                          width: 328.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0; i < imagesList.length; i++)
                                  GestureDetector(
                                    onTap: () {
                                      appController
                                          .selectedProductImageIndex.value = i;
                                      print(appController
                                          .selectedProductImageIndex.value);
                                    },
                                    child: Obx(() {
                                      return SmallImageTile(
                                        imageUrl: baseUrl + imagesList[i],
                                        isSelected: appController
                                                .selectedProductImageIndex
                                                .value ==
                                            i,
                                      );
                                    }),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // product details

                  Padding(
                    padding: EdgeInsets.all(15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: auction.productName,
                              fontSize: 20.sp,
                            ),
                            Spacer(),
                            Icon(Icons.star_rate_rounded),
                            CustomText(
                              text: "3.9",
                              fontSize: 20.sp,
                            ),
                          ],
                        ),
                        CustomText(
                          text: auction.description,
                          fontSize: 14.sp,
                          fontColor: Colors.black.withOpacity(0.6),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            CustomText(
                                text: "Starting bid : ", fontSize: 14.sp),
                            CustomText(
                              text: "₹${auction.startingBid}",
                              fontSize: 18.sp,
                              fontweight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: "Highest bid : ",
                              fontSize: 14.sp,
                            ),
                            CustomText(
                              text: "₹${auction.highestBid}",
                              fontSize: 18.sp,
                              fontweight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Divider(),
                        CustomText(
                          text: "Sell details",
                          fontSize: 18.sp,
                          fontweight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 22.r,
                            ),
                            SizedBox(width: 5.w),
                            CustomText(
                              text: auction.createdBy.fullName,
                              fontSize: 16.sp,
                            ),
                            Spacer(),
                            CustomElevatedButton(
                              height: 30.w,
                              width: 100.w,
                              onPressed: () {
                                Get.to(());
                              },
                              backgroundColor: primaryColor,
                              label: "Locate",
                              labelColor: Colors.black,
                              labelSize: 14.sp,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CustomText(
                          text: "Seller’s deals",
                          fontSize: 18.sp,
                          fontweight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 255.w,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Padding(
                              padding: index == 0
                                  ? EdgeInsets.only(left: 20.w, right: 5.w)
                                  : EdgeInsets.only(right: 5.w),
                              child: Center(
                                  child: UpcomingTile(
                                auctionItem: auction,
                              )),
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                            itemCount: 4,
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: EdgeInsets.zero,
                backgroundColor: Colors.white70,
                elevation: 0,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 22,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 15,
            right: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                  height: 50.w,
                  width: 175.w,
                  onPressed: () {
                    AuctionController auctionController = Get.put(AuctionController());
                    log(auctionController.bidsList.toString());
                    Get.to(ChatScreen(
                      firstName: auction.createdBy.fullName,
                      profilePic: auction.images[0],
                      profileId: auction.createdBy.id,
                    ));
                  },
                  backgroundColor: primaryColor,
                  label: "Message",
                  labelColor: Colors.black,
                  labelSize: 14.sp,
                ),
                CustomElevatedButton(
                  height: 50.w,
                  width: 175.w,
                  onPressed: () {
                    // Get.to(MakeABid(
                    //   auctionId: auction.id,
                    // ));
                    paymentController.getOrderId(auction.id);
                  },
                  backgroundColor: primaryColor,
                  label: "Make a bid",
                  labelColor: Colors.black,
                  labelSize: 14.sp,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
