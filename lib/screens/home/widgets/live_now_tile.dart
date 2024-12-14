import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:greenery/api/data/end_points.dart';
import 'package:greenery/core/constants/colors.dart';
import 'package:greenery/models/auction_model/auction_model.dart';
import 'package:greenery/screens/product_description/product_details_screen.dart';
import 'package:greenery/screens/widgets/custom_elevated_button.dart';
import 'package:greenery/screens/widgets/custom_text.dart';

class LiveNowTile extends StatelessWidget {
  const LiveNowTile({super.key, required this.auctionItem});
  final AuctionModel auctionItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen()),
      child: Container(
        height: 278.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: Offset(2.w, 4.w),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 117.w,
                width: 275.w,
                child: Image(
                  image: NetworkImage("$baseUrl${auctionItem.images[0]}"),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: 275.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: auctionItem.productName,
                            fontSize: 16.sp,
                            fontweight: FontWeight.w500,
                          ),
                          Spacer(),
                          CustomText(
                            text: "End in : 2 days",
                            fontSize: 12.sp,
                            fontweight: FontWeight.w700,
                          ),
                        ],
                      ),
                      CustomText(
                        text: auctionItem.description,
                        fontSize: 12.sp,
                        fontColor: Colors.black.withOpacity(0.6),
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: "last bid rate : ",
                            fontSize: 12.sp,
                            fontweight: FontWeight.w700,
                          ),
                          CustomText(
                            text: "₹${auctionItem.highestBid}",
                            fontSize: 15.sp,
                            fontweight: FontWeight.w700,
                          ),
                          Spacer(),
                          CustomText(
                            text: "seller rate : ",
                            fontSize: 12.sp,
                            fontweight: FontWeight.w700,
                          ),
                          CustomText(
                            text: "₹${auctionItem.startingBid}",
                            fontSize: 15.sp,
                            fontweight: FontWeight.w700,
                          ),
                        ],
                      ),
                      SizedBox(height: 13.h),
                      Center(
                        child: CustomElevatedButton(
                          height: 31.w,
                          width: 229.w,
                          onPressed: () {},
                          backgroundColor: primaryColor,
                          label: "bid",
                          labelColor: Colors.black,
                          labelSize: 15.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
