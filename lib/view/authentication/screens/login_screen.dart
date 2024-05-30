import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:texge/utils/color/colors.dart';
import 'package:texge/utils/size/constant_height.dart';
import 'package:texge/utils/text/custom_text';
import 'package:texge/view/authentication/screens/sign_up_screen.dart';
import 'package:texge/view/authentication/widgets/textform_widget.dart';
import 'package:texge/view/order_list/screens/order_list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                      key: formkey,
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // const KHeight(size: 0.1),
                          SizedBox(
                            width: size.width * 0.78,
                            child: const Image(
                              image: AssetImage("assets/images/complete_logo.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const KHeight(size: 0.09),
                          const CustomText(
                            text: "LOGIN",
                            color: themeColor,
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                          ),
                          const KHeight(size: 0.04),
                          TextFormWidget(
                              label: "Email/Username",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Username';
                                }
                                return null;
                              }),
                          const KHeight(size: 0.03),
                          TextFormWidget(
                            label: "Password",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Password';
                              }
                              return null;
                            },
                          ),
                          const KHeight(size: 0.08),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                              backgroundColor: const Color.fromARGB(210, 174, 157, 102),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const OrderListScreen(),
                              ));
                            },
                            child: const CustomText(
                              text: "Login",
                              fontSize: 20,
                              color: Color.fromARGB(255, 195, 195, 195),
                            ),
                          ),
                          const KHeight(size: 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomText(
                                text: "Dont't have an account ? ",
                                color: Colors.white60,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const SignUpScreen(),
                                    ));
                                  },
                                  child: const CustomText(
                                    text: "SIGN UP",
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
