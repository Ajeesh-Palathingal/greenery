import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:greenery/controllers/auction_controller.dart';
import 'package:greenery/screens/auction/auction_screen.dart';
import 'package:greenery/screens/home/widgets/categories_tile.dart';
import 'package:greenery/screens/home/widgets/live_now_tile.dart';
import 'package:greenery/screens/home/widgets/upcoming_tile.dart';
import 'package:greenery/screens/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  AuctionController auctionController = Get.put(AuctionController());

  @override
  Widget build(BuildContext context) {
    auctionController.getLiveAuctions();
    auctionController.getUpcomingAuctions();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundImage: NetworkImage(
                              "https://s3-alpha-sig.figma.com/img/6064/c0a1/eb3065519f49205e5a65e2381d2958ab?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=N6Nk7e8KL3GuGGaYDjbLxPwxc-c5MotipDvw1lU0AJuwth7yNl2zouC~alzwJ1jC7QYwL-4yg5Che~yToP1f2vADjzWD3p3SxLbVHG5AW7XHxbFxi4Mtp0eZMjnbi075KH22xS8wK1yEt-TplO8WeEDaQucPgz5nkxDYeW9THyZzFoZ0IgANv~4-Nqp2xmqm5mTX9sUUc04ad3je6qNbeIyNkZPFuEqcMuGWetNyeZJALXtvmDipffWafi6bqThRp-6piRQEwI6V2xGDNrHSoq5A4v0bUhF3AsfYS242S5IlrQM05cYzzghCAFqB4vfWZFVXceGJHg3qXVFfx-NpBw__"),
                        ),
                        SizedBox(width: 5.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Hello Emma!",
                              fontSize: 15.sp,
                            ),
                            CustomText(
                              text: "Let's start bidding",
                              fontSize: 10.sp,
                              fontColor: Colors.black.withOpacity(0.5),
                            )
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset("assets/svg/home/search.svg"),
                        SizedBox(
                          width: 5.w,
                        ),
                        SvgPicture.asset("assets/svg/home/notification.svg"),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    // categories
                    CustomText(
                      text: "Categories",
                      fontSize: 20.sp,
                      fontweight: FontWeight.w500,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CategoriesTile(
                          svg: "",
                          label: "Vegitables",
                        ),
                        CategoriesTile(
                          svg: "",
                          label: "fruits",
                        ),
                        CategoriesTile(
                          svg: "",
                          label: "Spices",
                        ),
                        CategoriesTile(
                          svg: "",
                          label: "diary",
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    // live now

                    Row(
                      children: [
                        CustomText(
                          text: "Live now!",
                          fontSize: 20.sp,
                          fontweight: FontWeight.w500,
                        ),
                        Spacer(),
                        CustomText(
                          text: "See All",
                          fontSize: 12.sp,
                          fontweight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 290.w,
                child: Obx(() {
                  return auctionController.isLoadingLive.value
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: auctionController.liveAuctionsList.length,
                          itemBuilder: (context, index) => Padding(
                            padding: index == 0
                                ? EdgeInsets.symmetric(horizontal: 15.w)
                                : EdgeInsets.only(right: 15.w),
                            child: Center(
                                child: LiveNowTile(
                              auctionItem:
                                  auctionController.liveAuctionsList[index],
                            )),
                          ),
                        );
                }),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    CustomText(
                      text: "Upcoming",
                      fontSize: 20.sp,
                      fontweight: FontWeight.w500,
                    ),
                    Spacer(),
                    CustomText(
                      text: "See All",
                      fontSize: 12.sp,
                      fontweight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 255.w,
                child: Obx(() {
                  return auctionController.isLoadingUpcoming.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: index == 0
                                ? EdgeInsets.only(left: 20.w, right: 5.w)
                                : EdgeInsets.only(right: 5.w),
                            child: Center(
                                child: UpcomingTile(
                              auctionItem:
                                  auctionController.upcomingAuctionsList[index],
                            )),
                          ),
                          itemCount:
                              auctionController.upcomingAuctionsList.length,
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
