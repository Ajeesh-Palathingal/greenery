import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greenery/api/data/end_points.dart';
import 'package:greenery/core/constants/colors.dart';
import 'package:greenery/models/auction_model/auction_model.dart';
import 'package:greenery/screens/widgets/custom_elevated_button.dart';
import 'package:greenery/screens/widgets/custom_text.dart';

class UpcomingTile extends StatelessWidget {
  const UpcomingTile({
    super.key,
    required this.auctionItem,
  });

  final AuctionModel auctionItem;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: 244.w,
            width: 170.w,
            child: Column(
              children: [
                SizedBox(
                  height: 102.w,
                  width: 170.w,
                  child: Image(
                    image: NetworkImage(
                      baseUrl + auctionItem.images[0],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),

                // bottom section
                Padding(
                  padding: EdgeInsets.all(5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: auctionItem.productName,
                        fontSize: 14.sp,
                        fontweight: FontWeight.w500,
                      ),
                      CustomText(
                        text: auctionItem.description,
                        fontSize: 12.sp,
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Container(
                            height: 24.w,
                            width: 25.w,
                            decoration: BoxDecoration(
                                color: Color(0xFF75E6A3).withOpacity(0.45),
                                border: Border.all(width: 0.5.w),
                                borderRadius: BorderRadius.circular(2.r)),
                            child: Center(
                                child: CustomText(
                              text: "12",
                              fontSize: 12.sp,
                              fontweight: FontWeight.w500,
                            )),
                          ),
                          SizedBox(width: 2.w),
                          CustomText(
                            text: "hr",
                            fontSize: 12.sp,
                            fontweight: FontWeight.w500,
                          ),
                          SizedBox(width: 2.w),
                          Container(
                            height: 24.w,
                            width: 25.w,
                            decoration: BoxDecoration(
                                color: Color(0xFF75E6A3).withOpacity(0.45),
                                border: Border.all(width: 0.5.w),
                                borderRadius: BorderRadius.circular(2.r)),
                            child: Center(
                                child: CustomText(
                              text: "12",
                              fontSize: 12.sp,
                              fontweight: FontWeight.w500,
                            )),
                          ),
                          SizedBox(width: 2.w),
                          CustomText(
                            text: "min",
                            fontSize: 12.sp,
                            fontweight: FontWeight.w500,
                          ),
                          SizedBox(width: 2.w),
                          Container(
                            height: 24.w,
                            width: 25.w,
                            decoration: BoxDecoration(
                                color: Color(0xFF75E6A3).withOpacity(0.45),
                                border: Border.all(width: 0.5.w),
                                borderRadius: BorderRadius.circular(2.r)),
                            child: Center(
                                child: CustomText(
                              text: "12",
                              fontSize: 12.sp,
                              fontweight: FontWeight.w500,
                            )),
                          ),
                          SizedBox(width: 2.w),
                          CustomText(
                            text: "sec",
                            fontSize: 12.sp,
                            fontweight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      CustomElevatedButton(
                        height: 30.w,
                        width: 160.w,
                        onPressed: () {},
                        backgroundColor: primaryColor,
                        label: "Notify me",
                        labelColor: Colors.black,
                        labelSize: 14.sp,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
