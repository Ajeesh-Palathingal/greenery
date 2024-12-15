import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:greenery/controllers/auction_controller.dart';
import 'package:greenery/core/constants/constants.dart';
import 'package:greenery/screens/auction/auction_screen.dart';
import 'package:greenery/screens/authentication/login.dart';
import 'package:greenery/screens/navbar_controll/navbar_controll_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    enterApp(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/splash/splash_screen.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  enterApp(BuildContext context) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
     
    final String? _token = await sharedPref.getString(TOKEN);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (_token == null) {
          Get.to(() => LoginPage());
        } else {
          Get.to(() => NavbarControlScreen());
        }
      },
    );
   
  }
}
