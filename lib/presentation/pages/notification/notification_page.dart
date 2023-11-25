import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
          statusBarIconBrightness:
              currentTheme ? Brightness.light : Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: currentTheme ? whiteColor : darkGrey,
        ),
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
