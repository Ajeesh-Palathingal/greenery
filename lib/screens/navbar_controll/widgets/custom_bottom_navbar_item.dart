import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greenery/controllers/app_controller.dart';
import 'package:greenery/core/constants/colors.dart';

import 'package:greenery/screens/widgets/custom_text.dart';

class CustomBottomNavbarItem extends StatelessWidget {
  CustomBottomNavbarItem({
    super.key,
    required this.iconPath,
    required this.index,
    required this.label,
  });
  final String iconPath;
  final String label;

  final int index;

  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          appController.bottomNavbarIndex.value = index;
        },
        child: SizedBox(
          width: 70.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
              ),
              CustomText(
                text: label,
                fontSize: 12.sp,
                fontColor: appController.bottomNavbarIndex.value == index
                    ? primaryColor
                    : Colors.black,
              ),
            ],
          ),
        ));
  }
}
