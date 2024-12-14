import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenery/controllers/app_controller.dart';
import 'package:greenery/screens/auction/auction_screen.dart';
import 'package:greenery/screens/home/home_screen.dart';
import 'package:greenery/screens/message_screen/MessageScreen.dart';
import 'package:greenery/screens/navbar_controll/widgets/custom_bottom_navbar.dart';
import 'package:greenery/screens/profile/profile_screen.dart';

class NavbarControlScreen extends StatelessWidget {
  NavbarControlScreen({super.key});

  AppController appController = Get.put(AppController());
  final pages = [
    HomeScreen(),
    AuctionScreen(),
    MessageScreen(),
    
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          return pages[appController.bottomNavbarIndex.value];
        }),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
