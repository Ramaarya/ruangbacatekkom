import 'dart:async';

import 'package:flutter/material.dart';
import '../Login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void tologin() {}

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
    return Scaffold(
      body: Center(
        child: Image.asset('assets/icons/logo_rbc.png'),
      ),
    );
  }
}
