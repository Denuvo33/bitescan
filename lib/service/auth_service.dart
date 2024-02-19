import 'package:bitescan/page/home_page.dart';
import 'package:bitescan/page/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (FirebaseAuth.instance.currentUser?.uid != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SignInPage()),
          );
        }
      },
    );

    return Scaffold(
      body: Center(
        child: SizedBox(child: Image.asset('images/logo bitescan.png')),
      ),
    );
  }
}
