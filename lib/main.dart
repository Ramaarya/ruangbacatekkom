import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MainScreen/screens/splash_screen.dart';
import 'backend/provider/auth_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplikasi RBC',
        theme: ThemeData(fontFamily: 'JakartaSans'),
        home: const SplashScreen(),
      ),
    );
  }
}
