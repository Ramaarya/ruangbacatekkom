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
    double diameter(BuildContext context) =>
        MediaQuery.of(context).size.width * 2 / 3;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          left: -diameter(context) / 2,
          top: -diameter(context) / 2,
          child: Container(
            width: diameter(context),
            height: diameter(context),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 15, 81, 180),
                    Colors.deepPurple,
                  ],
                )),
          ),
        ),
        Center(
          child: Image.asset('assets/icons/logo_rbc.png'),
        ),
        Positioned(
          right: -diameter(context) / 2,
          bottom: -diameter(context) / 2,
          child: Container(
            width: diameter(context),
            height: diameter(context),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple,
                    Color.fromARGB(255, 15, 81, 180),
                  ],
                )),
          ),
        ),
      ],
    ));
  }
}
