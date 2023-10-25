import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int index = 0;

  List<String> titles = [
    'Discover Your Dream Gateway',
    'Unclock the Beauty of Villa Living',
    'Create Memories in Style',
  ];

  List<String> subTitles = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Aryo Ganteng"),
      ),
    );
  }
}
