import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greenery/screens/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          // child: Image(
                          //   image: NetworkImage(
                          //       "https://s3-alpha-sig.figma.com/img/6064/c0a1/eb3065519f49205e5a65e2381d2958ab?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=N6Nk7e8KL3GuGGaYDjbLxPwxc-c5MotipDvw1lU0AJuwth7yNl2zouC~alzwJ1jC7QYwL-4yg5Che~yToP1f2vADjzWD3p3SxLbVHG5AW7XHxbFxi4Mtp0eZMjnbi075KH22xS8wK1yEt-TplO8WeEDaQucPgz5nkxDYeW9THyZzFoZ0IgANv~4-Nqp2xmqm5mTX9sUUc04ad3je6qNbeIyNkZPFuEqcMuGWetNyeZJALXtvmDipffWafi6bqThRp-6piRQEwI6V2xGDNrHSoq5A4v0bUhF3AsfYS242S5IlrQM05cYzzghCAFqB4vfWZFVXceGJHg3qXVFfx-NpBw__"),
                          // ),
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
                  ],
                ),
              ),
              SizedBox(
                height: 250.h,
                width: double.infinity,
              ),
              CustomText(text: "Home screen", fontSize: 18.sp),
            ],
          ),
        ),
      ),
    );
  }
}
