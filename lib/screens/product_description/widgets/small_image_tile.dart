import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenery/core/constants/colors.dart';

class SmallImageTile extends StatelessWidget {
  const SmallImageTile(
      {super.key, required this.imageUrl, required this.isSelected});
  final String imageUrl;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Stack(
        children: [
          Container(
            height: 56.w,
            width: 59.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Image(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 56.w,
            width: 59.w,
            decoration: BoxDecoration(
              color: isSelected
                  ? primaryColor.withOpacity(
                      0.6,
                    )
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ],
      ),
    );
  }
}
