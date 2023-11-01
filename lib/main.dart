import 'package:capstone_project_villa/presentation/pages/authentication/login_page.dart';
import 'package:capstone_project_villa/presentation/pages/authentication/register_page.dart';
import 'package:capstone_project_villa/presentation/pages/home/home_page.dart';
import 'package:capstone_project_villa/presentation/pages/navbar/bottom_navbar.dart';
import 'package:capstone_project_villa/presentation/pages/profile/profile_page.dart';
import 'package:capstone_project_villa/presentation/pages/splash/splash_screen.dart';
import 'package:capstone_project_villa/common/constants.dart';
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
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LoginPage.routeName: (context) => const LoginPage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        BottomNavbarPage.routeName: (context) => const BottomNavbarPage(),
        HomePage.routeName: (context) => const HomePage(),
        ProfilePage.routeName: (context) => const ProfilePage()
      },
    );
  }
}
