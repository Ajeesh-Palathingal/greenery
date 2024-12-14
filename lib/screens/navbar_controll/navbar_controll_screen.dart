import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenery/screens/widgets/custom_text.dart';

class NavbarControllScreen extends StatelessWidget {
  const NavbarControllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CustomText(
        text: "Navbar screen",
        fontSize: 14.sp,
      )),
    );
  }
}
