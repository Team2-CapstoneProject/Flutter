import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/presentation/bloc/home/home_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/home/widgets/list_card.dart';
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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool showMoreCategories = false;

  @override
  void initState() {
    context.read<HomeBloc>().add(HomeGetUserEvent());
    _tabController = TabController(length: 4, vsync: this);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text Welcome
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoaded) {
                  final user = state.user;
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text Nickname
                        Text(
                          'Hello, ${user.userData!.nickname}',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
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

                        const SizedBox(
                          height: 20.0,
                        ),

                        // Masih dalam bentuk kasar dan belum ada fungsinya
                        // Harusnya bisa gunain builder cuman nanti aja sekalian tambahin fungsinya
                        // Category Icon
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          // margin: EdgeInsets.only(
                          //     top: 32, left: 24, right: 24, bottom: 30),
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
                                                    fontSize: 14,
                                                    fontWeight: medium),
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: grey95,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
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
                                                        style: blackTextStyle
                                                            .copyWith(
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: grey95,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
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
                                                        style: blackTextStyle
                                                            .copyWith(
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: grey95,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
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
                                                        style: blackTextStyle
                                                            .copyWith(
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: grey95,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
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
                                                        style: blackTextStyle
                                                            .copyWith(
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: grey95,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
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
                                                        style: blackTextStyle
                                                            .copyWith(
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
                      ],
                    ),
                  );
                } else if (state is HomeLoading) {
                  return Container(
                    margin: const EdgeInsets.only(
                        top: 15, bottom: 20, left: 30, right: 30),
                    child: Shimmer.fromColors(
                      baseColor: white70Color,
                      highlightColor: grey95,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Shimmer Text Nickname
                          Container(
                            height: 24,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),

                          const SizedBox(
                            height: 20.0,
                          ),

                          // Shimmer Search Button
                          Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),

                          const SizedBox(
                            height: 20.0,
                          ),

                          // Shimmer Category Icon
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: GridView.count(
                              crossAxisCount: 4,
                              shrinkWrap: true,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        color: grey95,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      height: 18,
                                      width: 26,
                                      color: grey95,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        color: grey95,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      height: 18,
                                      width: 26,
                                      color: grey95,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        color: grey95,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      height: 18,
                                      width: 26,
                                      color: grey95,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        color: grey95,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      height: 18,
                                      width: 26,
                                      color: grey95,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),

            // TabBar & Card Recommended
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoaded) {
                  return Column(
                    children: [
                      TabBar(
                        controller: _tabController,
                        labelColor: blackColor,
                        labelStyle: blackTextStyle,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: primaryColor,
                        isScrollable: true,
                        tabs: [
                          Tab(
                            text: 'Recommended',
                          ),
                          Tab(
                            text: 'All',
                          ),
                          Tab(
                            text: 'Popular',
                          ),
                          Tab(
                            text: 'Rating',
                          ),
                        ],
                      ),
                      Container(
                        height: 300,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            // Recommended Vila
                            ListView.builder(
                              padding: EdgeInsets.only(left: 30),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.user.recommendVilas?.length,
                              itemBuilder: (context, index) {
                                final vila = state.user.recommendVilas![index];
                                return CardCustom(
                                  name: vila.name.toString(),
                                  location: vila.location.toString(),
                                  price: vila.price,
                                  score: vila.score,
                                  image: vila.vilaImages?.sliderImage,
                                );
                              },
                            ),

                            // All Vila
                            ListView.builder(
                              padding: EdgeInsets.only(left: 30),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.user.allVilas?.length,
                              itemBuilder: (context, index) {
                                final vila = state.user.allVilas![index];
                                return CardCustom(
                                  name: vila.name.toString(),
                                  location: vila.location.toString(),
                                  price: vila.price,
                                  score: vila.score,
                                  image: vila.vilaImages?.sliderImage,
                                );
                              },
                            ),

                            // Popular Vila
                            ListView.builder(
                              padding: EdgeInsets.only(left: 30),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.user.popularVilas?.length,
                              itemBuilder: (context, index) {
                                final vila = state.user.popularVilas![index];
                                return CardCustom(
                                  name: vila.name.toString(),
                                  location: vila.location.toString(),
                                  price: vila.price,
                                  score: vila.score,
                                  image: vila.vilaImages?.sliderImage,
                                );
                              },
                            ),

                            // Rating Vila
                            ListView.builder(
                              padding: EdgeInsets.only(left: 30),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.user.recommendVilas?.length,
                              itemBuilder: (context, index) {
                                final vila = state.user.recommendVilas![index];
                                return CardCustom(
                                  name: vila.name.toString(),
                                  location: vila.location.toString(),
                                  price: vila.price,
                                  score: vila.score,
                                  image: vila.vilaImages?.sliderImage,
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                } else if (state is HomeLoading) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                        height: 23,
                        width: MediaQuery.of(context).size.width,
                        color: white70Color,
                      ),
                      Container(
                        height: 300,
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 30),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              color: white70Color,
                              child: Container(
                                padding: EdgeInsets.only(left: 16, bottom: 18),
                                height: 300,
                                width: 206,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),

            // ForYou
          ],
        ),
      ),
    );
  }
}
