import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottie extends StatelessWidget {
  final String assetPath;

  const CustomLottie({Key? key, required this.assetPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.1,
      ),
      child: Lottie.asset(assetPath),
    );
  }
}
