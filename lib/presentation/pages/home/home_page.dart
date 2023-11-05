import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/presentation/bloc/home/home_bloc.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override


  void initState() {
    context.read<HomeBloc>().add(HomeGetUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Headers
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text Welcome
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoaded) {
                    final user = state.user;
                    return Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 20),
                      child: Text(
                        'Hello, ${user.userData!.nickname}',
                        style: blackTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                    );
                  } else if (state is HomeLoading) {
                    return Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 20),
                      child: Shimmer.fromColors(
                        baseColor: white70Color,
                        highlightColor: grey95,
                        child: Container(
                          height: 24,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),

              // Search Button
              CustomButton(onPressed: () {}, text: 'Search')
            ],
          ),
        ),
      ),
    );
  }
}
