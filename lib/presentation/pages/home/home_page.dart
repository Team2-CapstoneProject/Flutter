import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: whiteColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: whiteColor,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 30),
            child: Row(
              children: [
                Icon(
                  Iconsax.archive_1,
                  color: darkGrey,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Icon(
                  Iconsax.notification,
                  color: darkGrey,
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Howdy, Aezakmy',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
