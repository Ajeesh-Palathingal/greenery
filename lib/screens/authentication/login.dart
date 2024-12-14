import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:greenery/controllers/auth_controller.dart';
import 'package:greenery/screens/auction/auction_screen.dart';
import 'package:greenery/screens/authentication/sign_up.dart';
import 'package:greenery/screens/navbar_controll/navbar_controll_screen.dart';

import 'package:greenery/screens/widgets/custom_text.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Center(
                    child: Image.asset(
                      'assets/authentication/login.png',
                      height: 229,
                      width: 370,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                CustomText(
                  text: "Welcome Back!",
                  fontSize: 24,
                  fontweight: FontWeight.w500,
                ),
                CustomText(
                  text: "Let's login for explore bidding products",
                  fontSize: 14,
                  fontColor: const Color.fromRGBO(
                    0,
                    0,
                    0,
                    0.75,
                  ),
                ),
                const SizedBox(height: 16.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        height: 60.w,
                        width: 350.w,
                        color: const Color.fromRGBO(117, 230, 163, 0.15),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            fillColor:
                                const Color.fromRGBO(117, 230, 163, 0.15),
                            labelText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(r'^\S+@\S+\.\S+\$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        height: 60.w,
                        width: 350.w,
                        color: const Color.fromRGBO(117, 230, 163, 0.15),
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Forgot Password Logic Here
                          },
                          child: CustomText(
                            text: 'Forgot password?',
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      GestureDetector(
                        onTap: () async {
                          final isValidLogin = await authController.login(
                              _emailController.text, _passwordController.text);
                          if (isValidLogin) {
                            Get.to(NavbarControlScreen());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text("Username and Password doesn't match"),
                              ),
                            );
                          }
                       
                        },
                        child: Container(
                          height: 60.w,
                          width: 350.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(117, 230, 163, 1),
                          ),
                          child: Center(
                            child: Obx(() {
                              return authController.isLoading.value
                                  ? CircularProgressIndicator()
                                  : Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    );
                            }),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage())),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Color.fromRGBO(117, 230, 163, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
