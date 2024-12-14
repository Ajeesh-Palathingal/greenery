import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:greenery/controllers/app_controller.dart';
import 'package:greenery/core/constants/colors.dart';
import 'package:greenery/screens/product_description/widgets/small_image_tile.dart';
import 'package:greenery/screens/widgets/custom_elevated_button.dart';
import 'package:greenery/screens/widgets/custom_text.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});
  AppController appController = Get.put(AppController());

  final List imagesList = [
    "https://s3-alpha-sig.figma.com/img/d6ac/5486/83d176e34ebdef5d1ce493934f8c8ba8?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AjTw4s5LfvusPM4n2xXx4VmM9Ks0220jEkCBlV-4B74qdaBDDGtWl8tDPxfYlTLNmf6BArTgMcO~oV1Z99pSPYF~EWyPFddFvESwP8B-tloTX7DXxCC7j65GYKZ6Z8NOvjEH-gL~2zV48Ujbk4l7Q4QbKkUPPj3vEqVXHL8GGZ1JO4U3FrRUB4xNG5zMYRCKCMnACrmq7JsU~82rpCx6E-jLj3h8-Re15dWPM4v5HvK81A8f8Jm6NDWfWresJjyY0Qs-htHyyqv1E9QUqNVA5eYph4PnqKZf5rHV3-UcrprsM9zrXVlgKp55JDLW3wfkkpRpH2FEnR-BCpBSWw0GEw__",
    "https://s3-alpha-sig.figma.com/img/1cbc/e4af/4beaea825b03924f9c6c4836bf55bce5?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=MP~j~OmFT3sW8XDikc6zrimrc8ZCHk9-ra6Bmuz9teqgs~cwiabSaITogPCBTc7aRScjr2ePVjKVEroB69pCEjYhCYILgMhcQmqHumkXD1lzqnCM3KcBcSOdEAo3nFdN6zYZkdIwxJFbjbngv0tmLo56JgMAeZDrCcJolOWz93JnertIfRlMILzO22ypplXizfWgnyCJPt0u1w7FGADBsbreguUxtRbMsVxaYCT5nJkzMiynwI~KhmDErvhqiex~Td2ngdKaIsYtJn2jfyNIXLZAvGvWOnyWtcwLByNFHTFMq~vyg1DIgWnal0ag8Euk1vbWJQVZh7U44xGvG7avrg__",
    "https://s3-alpha-sig.figma.com/img/e40a/a9b8/e892cf8a0c9286688304d72ffe570c4f?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=BK9RkxKqRGDPXDOtdMA14K4DNlIfT33o0oO5hNFEDZdu1qC4ttLOOMQ58ZzZO8oVjX0jgG3~jlGc5JO9OcmEpEXCmxTiEfPzCvgM-C6fA0Is~ZlbEQ41YHZaan2vWPrWKIu-6-r~W1HbMHgjFcWrOjZ97pmtbUzHVT3Q3BesmJLNM-OfJPo1~JCsdgRR4w-MBbHVWIyszxGYvhg5JQlmEb5rVO9S8t~dsaB5t3oVuV4lYFTUoYJaLgoRsAqvXa3nLIfCt6jDj0MEGdEZSSALfCPLEPN-KyyCUy~MpXKdu78ROQSXxMuU7AZVWwbyK32bPXKiHGqGF8dL-90YoibHLg__",
    "https://s3-alpha-sig.figma.com/img/f483/93e5/0af200f28a230a77492d069ec91fba01?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=O09PczSuBeX6d01BRbycPUlR13zjuzSJI-jSz9Uh~4p0sw~l7JaXkeLPotnRrQ3L19pq7hRrb~~770AlrRAngDox-JRvhLjel1YsdfQIrnupJcDb9emQNMc9~SlfoBIl3EqwbXHint3z~KNj-vPL1rresLIQ9xnhwMyd9zBsizknJtHTkn7VPXh-LX6eWdiZmsgi3FHL4dhyWMEQY~AAoSTxF6VJvwFfEJJaMbmCIDa~55ZiNGvqlo62S~u85CAtM1-SLA4RXIIlTZ3RGnQFgGl3WZ6ucloMezM6XnaNwgQ7Y3IYSg5wsVoO18kS4cm~Yh~6Dm0iq~QnFQ981TlDeQ__",
    "https://s3-alpha-sig.figma.com/img/e30b/afd2/6562f2110ff2233d39c59cd4af40a644?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Zx1u72HovMhTxf4phR1O5mobRhjKPHL7ShN6WbFJ9DbZya3ouQ6ChmPKcUisEgpdS~WxWL7vO-4Ra9lWRR1sHtGtyPTvmSigPvrt0-K43zcSgqzPhYwKul~DtKt2DR~lftLCLbw2ykInlOJMkXJ2QKfy-KKjrKbTs8-m4Zg9-ne7qWpVz7uM2oC1aAbCoNX63hfXb-PX8HocmRE4xcOKVlLHCBDw7XuCCoPiFpKXrGUpnJ6~h2cz8U~TfwpyAio47r78CjRhPzl6t7dikdYqzFVmgriLDSnC-TSjCjWx33X4QFnyQGC1LjjArIH7pkDc6cBEOF4tbtGnOfnY3XckQg__",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                        image: NetworkImage(imagesList[
                            appController.selectedProductImageIndex.value]),
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
                                    imageUrl: imagesList[i],
                                    isSelected: appController
                                            .selectedProductImageIndex.value ==
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
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: "Product name",
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
                      text:
                          "Lorem ipsum dolor sit amet consectetur. Adipiscing quis quisque condimentum tempor nullam sociis. Enim velit nulla nulla rhoncus dis aliquet enim. Habitant posuere molestie lectus accumsan sit sapien amet vitae leo. Habitant diam massa duis amet.",
                      fontSize: 14.sp,
                      fontColor: Colors.black.withOpacity(0.6),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        CustomText(text: "Starting bid : ", fontSize: 14.sp),
                        CustomText(
                          text: "₹200",
                          fontSize: 18.sp,
                          fontweight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(text: "Starting bid : ", fontSize: 14.sp),
                        CustomText(
                          text: "₹200",
                          fontSize: 18.sp,
                          fontweight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Divider(),
                    CustomText(
                      text: "Sell details",
                      fontSize: 18.sp,
                      fontweight: FontWeight.w600,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                        ),
                        SizedBox(width: 5.w),
                        CustomText(
                          text: "Samalex",
                          fontSize: 14.sp,
                        ),
                        Spacer(),
                        CustomElevatedButton(
                            height: 30.w,
                            width: 100.w,
                            onPressed: () {},
                            backgroundColor: primaryColor,
                            label: "Locate",
                            labelColor: Colors.black,
                            labelSize: 12.sp),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
