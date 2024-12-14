import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenery/screens/widgets/custom_text.dart';

import '../widgets/custom_appbar_widget.dart';

class AuctionScreen extends StatelessWidget {
  const AuctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: "Auction",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250.h,
              width: double.infinity,
            ),
            CustomText(text: "Auction screen", fontSize: 18.sp),
          ],
        ),
      ),
    );
  }
}
