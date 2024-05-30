import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:texge/utils/size/constant_height.dart';
import 'package:texge/view/authentication/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
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
                filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                child: Container(
                  color: Colors.black.withOpacity(0.32),
                ),
              ),
            ),
            Positioned(
                // top: 90,
                // left: 50,
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: size.height * 0.2,
                    image: const AssetImage("assets/images/logo.png"),
                    fit: BoxFit.cover,
                  ),
                  const KHeight(size: 0.02),
                  Image(
                    height: size.height * 0.2,
                    image: const AssetImage("assets/images/name_logo.png"),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotoHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => const LoginScreen(),
      ),
    );
  }
}
