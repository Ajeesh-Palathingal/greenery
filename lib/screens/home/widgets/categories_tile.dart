import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenery/screens/widgets/custom_text.dart';

class CategoriesTile extends StatelessWidget {
  const CategoriesTile({super.key, required this.svg, required this.label});

  final String svg;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65.w,
          width: 65.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.r),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF5AE4A8).withOpacity(0.55),
                Color(0xFF327E5D).withOpacity(0.12),
              ],
            ),
          ),
        ),
        CustomText(
          text: label,
          fontSize: 12.sp,
        )
      ],
    );
  }
}
