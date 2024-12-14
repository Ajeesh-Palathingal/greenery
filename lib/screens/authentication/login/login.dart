import 'package:flutter/material.dart';

import 'package:greenery/screens/widgets/custom_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String username = '';
    String password = '';

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0),
              // Top Image with Curved Borders
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Center(
                  child: Image.asset(
                    'assets/authentication/signup/Rectangle708.png', // Replace with your image path
                    height: 229,
                    width: 370,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                "Welcome Back!",
              ),
              Text(
                "Let's login for explore bidding products",
              ),
              const SizedBox(height: 16.0),
              // Login Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      onSaved: (value) => username = value!,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.visibility_off),
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
                      onSaved: (value) => password = value!,
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
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Add Login Logic Here
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Logging in as $username'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Sign Up'),
                    ),
                    const SizedBox(height: 24.0),
                    Center(
                      child: CustomText(
                        text: "You can connect with",
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Google Sign In Button
                    OutlinedButton.icon(
                      onPressed: () {
                        // Google Sign-In Logic Here
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.black12),
                      ),
                      label: CustomText(
                        text: "Sign in with Google",
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Navigate to Signup Page
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: CustomText(
                          text: "Don't have an account? Sign Up",
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
