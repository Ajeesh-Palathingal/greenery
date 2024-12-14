import 'package:flutter/material.dart';
import 'package:greenery/screens/auction/auction_screen.dart';
import 'package:greenery/screens/authentication/login.dart';
import 'package:greenery/screens/navbar_controll/navbar_controll_screen.dart';

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
    Future.delayed(
      const Duration(seconds: 6),
      () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()));
      },
    );
  }
}
