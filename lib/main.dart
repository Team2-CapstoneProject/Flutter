import 'package:capstone_project_villa/presentation/pages/splash/splash_screen.dart';
import 'package:capstone_project_villa/styles/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Azure Voyage',
      theme: ThemeData(
        scaffoldBackgroundColor: whiteColor,
      ),
      home: const SplashScreen(),
    );
  }
}
