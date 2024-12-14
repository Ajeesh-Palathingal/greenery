import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greenery/core/constants/colors.dart';
import 'package:greenery/screens/widgets/custom_elevated_button.dart';
import 'package:greenery/screens/widgets/custom_text.dart';

class UpcomingTile extends StatelessWidget {
  const UpcomingTile({
    super.key,
  });

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
                        "https://s3-alpha-sig.figma.com/img/f869/f610/0123aa9089a83e3b494ffb29656db470?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=aKxT2eE9f7SsQN~DWsRW7cy-4u1PqjZ2nRL~PqhThSbqeHv5SJ0xjEgXinggazEhJLFeaf1vRyPQiPWINvD1bLOEmNb3~Y4MKFvEtE0a57MYmloMio0O1lKnpP1l7Qy5JxJOzD8Q771ESbsisi6TIs-~tNkf-ELSl6imwjMgLJPqxNLJcLmi7Y8BikGHkWwGoebiS13OJQz-HzcN1iMXuzS8fVnsBSFiqaOJaTPaNKgQgOShvOy5E1Got5~mMhDLjjbHf0JioWq8aPDxY7w6xKsE8xPP4HS~eMbdQXVQHnEHbsGvm9ktQsyrw3lBGVANbYncpR8spmoi3Np5nytUsw__"),
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
                        text: "Product Name",
                        fontSize: 14.sp,
                        fontweight: FontWeight.w500,
                      ),
                      CustomText(
                        text:
                            "Lorem ipsum dolor sit amet consectetur. Placerat morbi in eu pharetra......",
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
