import 'package:flutter/material.dart';
import 'package:facebook_clone/login_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ Facebook logo
            Image.asset(
              "assets/images/fb.png",
              width: 120,
            ),

            const SizedBox(height: 20),

            // ✅ Subtle loading indicator
            const CircularProgressIndicator(
              color: Colors.blue,
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}


