import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greenery/controllers/app_controller.dart';
import 'package:greenery/screens/navbar_controll/widgets/custom_bottom_navbar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({Key? key}) : super(key: key);
  AppController appController = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(21.r),
          topRight: Radius.circular(21.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavbarItem(
                iconPath: appController.bottomNavbarIndex.value == 0
                    ? "assets/svg/bottom_navbar/selected_home.svg"
                    : "assets/svg/bottom_navbar/unselected_home.svg",
                label: "Home",
                index: 0,
              ),
              CustomBottomNavbarItem(
                iconPath: appController.bottomNavbarIndex.value == 1
                    ? "assets/svg/bottom_navbar/selected_auction.svg"
                    : "assets/svg/bottom_navbar/unselected_auction.svg",
                label: "Auction",
                index: 1,
              ),
              CustomBottomNavbarItem(
                iconPath: appController.bottomNavbarIndex.value == 2
                    ? "assets/svg/bottom_navbar/selected_message.svg"
                    : "assets/svg/bottom_navbar/unselected_message.svg",
                label: "Message",
                index: 2,
              ),
              CustomBottomNavbarItem(
                iconPath: appController.bottomNavbarIndex.value == 3
                    ? "assets/svg/bottom_navbar/selected_profile.svg"
                    : "assets/svg/bottom_navbar/unselected_profile.svg",
                label: "Profile",
                index: 3,
              ),
            ],
          );
        }),
      ),
    );
  }
}
