import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_lottie.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(color: darkGrey),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CustomLottie(assetPath: 'assets/lottie/notification.json'),
          ],
        ),
      )),
    );
  }
}
