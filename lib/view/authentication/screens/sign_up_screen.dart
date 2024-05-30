// sign_up_screen.dart
// ignore_for_file: avoid_print

import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:texge/controller/auth_controller.dart';
import 'package:texge/utils/color/colors.dart';
import 'package:texge/utils/size/constant_height.dart';
import 'package:texge/utils/text/custom_text';
import 'package:texge/view/authentication/screens/login_screen.dart';
import 'package:texge/view/authentication/widgets/textform_widget.dart';
import 'package:texge/view/order_list/screens/order_list_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final SignupService _signupService = SignupService();

  void _submitForm() async {
    if (formKey.currentState!.validate()) {
      final response = await _signupService.signup(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      );

      if (response['response'] == 'success') {
        log(response.toString());
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const OrderListScreen(),
        ));
      } else {
        print('Signup failed: ${response['message']}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signup failed: ${response['message']}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const SizedBox(
              height: double.infinity,
              child: Image(
                image: AssetImage("assets/images/bg_image.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                child: Container(
                  color: Colors.transparent.withOpacity(0.518),
                ),
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.78,
                            child: const Image(
                              image: AssetImage("assets/images/complete_logo.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const KHeight(size: 0.04),
                          const CustomText(
                            text: "SIGN UP",
                            color: themeColor,
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                          ),
                          const KHeight(size: 0.02),
                          TextFormWidget(
                            controller: nameController,
                            label: "Name",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter name';
                              }
                              return null;
                            },
                          ),
                          const KHeight(size: 0.03),
                          TextFormWidget(
                            controller: emailController,
                            label: "Email",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter email';
                              }
                              // Basic email format validation
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const KHeight(size: 0.03),
                          TextFormWidget(
                            controller: passwordController,
                            label: "Password",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Password';
                              }
                              return null;
                            },
                          ),
                          const KHeight(size: 0.02),
                          TextFormWidget(
                            controller: phoneController,
                            label: "Phone",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter phone number';
                              }
                              if (!RegExp(r'^\+?1?\d{9,15}$').hasMatch(value)) {
                                return 'Enter a valid phone number';
                              }
                              return null;
                            },
                          ),
                          const KHeight(size: 0.02),
                          TextFormWidget(
                            controller: confirmPasswordController,
                            label: "Confirm Password",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter password confirmation';
                              }
                              if (value != passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          const KHeight(size: 0.04),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                              backgroundColor: const Color.fromARGB(210, 174, 157, 102),
                            ),
                            onPressed: _submitForm,
                            child: const CustomText(
                              text: "Sign Up",
                              fontSize: 20,
                              color: Color.fromARGB(255, 195, 195, 195),
                            ),
                          ),
                          const KHeight(size: 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomText(
                                text: "Already have an account ? ",
                                color: Colors.white60,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ));
                                  },
                                  child: const CustomText(
                                    text: "LOGIN",
                                    color: themeColor,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
