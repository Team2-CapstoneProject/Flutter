import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/presentation/pages/navbar/bottom_navbar.dart';
import 'package:capstone_project_villa/presentation/pages/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> route() async {
    Future.delayed(const Duration(seconds: 2), () async {
      final isLoggedIn = await AuthLocalDataSource().isUserLoggedIn();
      if (isLoggedIn) {
        print(isLoggedIn);
        Navigator.pushReplacementNamed(context, BottomNavbarPage.routeName);
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnBoardingPage(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    route();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/logo.png'),
          width: 120,
        ),
      ),
    );
  }
}
