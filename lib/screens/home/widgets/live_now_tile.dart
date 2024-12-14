import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenery/core/constants/colors.dart';
import 'package:greenery/screens/widgets/custom_elevated_button.dart';
import 'package:greenery/screens/widgets/custom_text.dart';

class LiveNowTile extends StatelessWidget {
  const LiveNowTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 277.w,
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
                image: NetworkImage(
                    "https://s3-alpha-sig.figma.com/img/6bd1/2ddc/36ceab8b257480d16d86c02302224180?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=DpdGR1K2fSugraZvmkr1hrnwv1kB4LsOTCWdQw9-WPOpoqSOfLeP7hEf6Kp6qJ1RgE2W2Bh5FjeFYaKfMa~GolpOdNyYPzt-1xThL9F8hU6sRP5saFygMdq~129iEzWtIR8VL8mWADeCOkS934Zl4ZbeaPYOvYFz5sLXZzRGUX4O2CbpYywc5byYVzPkoiuBb1EKhhbaDF~xY3phSJGU2jmA4N6cXds-Bcsq83V20KFwfG~QNrKiwFufk9M2Ii63hzGQB0ONlDtrkx2XMJVc8d4tubM56bL~wgi6wU1B-DqqZXDehaPSX62H2WHLuK-DrQyPdaqMRk2RxUxKtHhTBw__"),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5.h),
            SizedBox(
              width: 275.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: "Product Name",
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
                      text:
                          "Lorem ipsum dolor sit amet consectetur. Placerat morbi in eu pharetra erat facilisi dui pellentesque elit..........",
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
                          text: "₹480",
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
                          text: "₹480",
                          fontSize: 15.sp,
                          fontweight: FontWeight.w700,
                        ),
                      ],
                    ),
                    SizedBox(height: 13.h),
                    CustomElevatedButton(
                      height: 31.w,
                      width: 229.w,
                      onPressed: () {},
                      backgroundColor: primaryColor,
                      label: "bid",
                      labelColor: Colors.black,
                      labelSize: 15.sp,
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
