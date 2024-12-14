import 'package:flutter/material.dart';
import 'package:greenery/screens/authentication/login/login.dart';
import 'package:greenery/screens/widgets/custom_text.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String email = '';
    String password = '';
    String confirmPassword = '';
    String username = '';

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Center(
                  child: Image.asset(
                    'assets/authentication/signup/Rectangle708.png', // Replace with your image path
                    height: 229,
                    width: 370,

                    fit: BoxFit.cover,
                  ),
                ),
              ),
              CustomText(
                text: "Let's Get Started",
                fontStyle: FontStyle.values.first,
                fontSize: 20,
              ),
              CustomText(
                  text: "create an account to sell and buy your products ",
                  fontSize: 14),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'User Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'^\S+@\S+\.\S+\$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      onSaved: (value) => username = value!,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
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
                      onSaved: (value) => email = value!,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
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
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        } else if (value != password) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      onSaved: (value) => confirmPassword = value!,
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Add your signup logic here
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Signing up as $email')),
                          );
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                        child: CustomText(
                            text: "You can connect with", fontSize: 13)),
                    const SizedBox(height: 15.0),
                    ElevatedButton(
                        onPressed: () {},
                        child: CustomText(
                            text: " Sign Up with Google", fontSize: 13)),
                    TextButton(
                      onPressed: () {
                        // Navigate back to the login page

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: const Text('Already have an account? Sign In'),
                    ),
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
