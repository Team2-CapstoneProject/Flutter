import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/presentation/bloc/home/home_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/search/search_page.dart';
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
  bool showMoreCategories = false;
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
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: grey95,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      SearchPage.routeName,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Iconsax.search_normal,
                        color: greyColor,
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Search',
                        style: greyTextStyle.copyWith(
                          fontWeight: regular,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // Masih dalam bentuk kasar dan belum ada fungsinya
              // Harusnya bisa gunain builder cuman nanti aja sekalian tambahin fungsinya
              // Category Icon
              Container(
                margin: EdgeInsets.only(top: 32, left: 24, right: 24),
                child: GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: grey95,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Iconsax.house_2,
                              size: 24,
                              color: darkGrey,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Villa',
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: grey95,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Iconsax.building_44,
                              size: 24,
                              color: darkGrey,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Hotel',
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: grey95,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Iconsax.smart_car,
                              size: 24,
                              color: darkGrey,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Travel',
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showMoreCategories = !showMoreCategories;
                        });
                        if (showMoreCategories) {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Our Accomodations',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 14, fontWeight: medium),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        size: 21,
                                      ),
                                    )
                                  ],
                                ),
                                content: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  child: GridView.count(
                                    crossAxisCount: 3,
                                    shrinkWrap: true,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 48,
                                              width: 48,
                                              decoration: BoxDecoration(
                                                color: grey95,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Icon(
                                                Iconsax.house_2,
                                                size: 24,
                                                color: darkGrey,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Villa',
                                              style: blackTextStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: regular,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 48,
                                              width: 48,
                                              decoration: BoxDecoration(
                                                color: grey95,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Icon(
                                                Iconsax.building,
                                                size: 24,
                                                color: darkGrey,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Hotel',
                                              style: blackTextStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: regular,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 48,
                                              width: 48,
                                              decoration: BoxDecoration(
                                                color: grey95,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Icon(
                                                Iconsax.smart_car,
                                                size: 24,
                                                color: darkGrey,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Travel',
                                              style: blackTextStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: regular,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 48,
                                              width: 48,
                                              decoration: BoxDecoration(
                                                color: grey95,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Icon(
                                                Iconsax.car,
                                                size: 24,
                                                color: darkGrey,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Rental',
                                              style: blackTextStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: regular,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 48,
                                              width: 48,
                                              decoration: BoxDecoration(
                                                color: grey95,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Icon(
                                                Iconsax.people,
                                                size: 24,
                                                color: darkGrey,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Guide',
                                              style: blackTextStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: regular,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: grey95,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Iconsax.category,
                              size: 24,
                              color: darkGrey,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'More',
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // TabBar & Card Recommended

              // ForYou
            ],
          ),
        ),
      ),
    );
  }
}
