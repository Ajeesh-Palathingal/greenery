import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  CustomAppBarWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            side: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
            padding: EdgeInsets.zero,
            elevation: 0,
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
      title: CustomText(
        text: title,
        fontSize: 18.sp,
        fontweight: FontWeight.w600,
      ),
    );
  }
}
