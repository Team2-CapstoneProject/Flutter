import 'package:capstone_project_villa/presentation/pages/bookmark/bookmark_page.dart';
import 'package:capstone_project_villa/presentation/pages/category/category_vila_page.dart';
import 'package:capstone_project_villa/presentation/pages/detail/detail_page.dart';
import 'package:capstone_project_villa/presentation/pages/home/widgets/category_card.dart';
import 'package:capstone_project_villa/presentation/pages/home/widgets/foryou_card.dart';
import 'package:capstone_project_villa/presentation/pages/home/widgets/shimmer.dart';
import 'package:capstone_project_villa/presentation/pages/home/widgets/shimmer_tab.dart';
import 'package:capstone_project_villa/presentation/pages/home/widgets/tab_card.dart';
import 'package:capstone_project_villa/presentation/pages/search/search_page.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/presentation/bloc/home/home_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/home/widgets/list_card.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({
    Key? key,
  }) : super(key: key);

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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookmarkPage()),
                    );
                  },
                  child: Icon(
                    Iconsax.archive_1,
                    color: darkGrey,
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => const CustomDialog(),
                    );
                  },
                  child: Icon(
                    Iconsax.notification,
                    color: darkGrey,
                  ),
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
                          'greeting'
                              .tr(namedArgs: {'name': user.userData.nickname}),
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                        ),

                        // Search Button
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchPage(),
                                ),
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

                        // Category Icon
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: GridView.count(
                            crossAxisCount: 4,
                            shrinkWrap: true,
                            children: [
                              CategoryCard(
                                icon: Iconsax.house_2,
                                label: 'Villa',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CategoryVilaPage(),
                                    ),
                                  );
                                },
                              ),
                              CategoryCard(
                                icon: Iconsax.building_44,
                                label: 'Hotel',
                                onTap: () {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) => const CustomDialog(),
                                  );
                                },
                              ),
                              CategoryCard(
                                icon: Iconsax.smart_car,
                                label: 'Travel',
                                onTap: () {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) => const CustomDialog(),
                                  );
                                },
                              ),
                              CategoryCard(
                                icon: Iconsax.category,
                                label: 'more'.tr(),
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
                                                'our_accommodation'.tr(),
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
                                                CategoryCard(
                                                  icon: Iconsax.house_2,
                                                  label: 'Villa',
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            CategoryVilaPage(),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                CategoryCard(
                                                  icon: Iconsax.building,
                                                  label: 'Hotel',
                                                  onTap: () {
                                                    showDialog(
                                                      barrierDismissible: false,
                                                      context: context,
                                                      builder: (context) =>
                                                          const CustomDialog(),
                                                    );
                                                  },
                                                ),
                                                CategoryCard(
                                                  icon: Iconsax.smart_car,
                                                  label: 'Travel',
                                                  onTap: () {
                                                    showDialog(
                                                      barrierDismissible: false,
                                                      context: context,
                                                      builder: (context) =>
                                                          const CustomDialog(),
                                                    );
                                                  },
                                                ),
                                                CategoryCard(
                                                  icon: Iconsax.car,
                                                  label: 'Rental',
                                                  onTap: () {
                                                    showDialog(
                                                      barrierDismissible: false,
                                                      context: context,
                                                      builder: (context) =>
                                                          const CustomDialog(),
                                                    );
                                                  },
                                                ),
                                                CategoryCard(
                                                  icon: Iconsax.people,
                                                  label: 'Guide',
                                                  onTap: () {
                                                    showDialog(
                                                      barrierDismissible: false,
                                                      context: context,
                                                      builder: (context) =>
                                                          const CustomDialog(),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                } else if (state is HomeLoading) {
                  return ShimmerCard();
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTabBar(
                        tabController: _tabController,
                        tabTitles: ['Recommended', 'All', 'Popular', 'Rating'],
                        tabViews: [
                          // Recommended Vila
                          ListView.builder(
                            padding: EdgeInsets.only(left: 30),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.user.recommendVilas.length,
                            itemBuilder: (context, index) {
                              final vila = state.user.recommendVilas[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailPage(id: vila.id)));
                                },
                                child: CardCustom(
                                  name: vila.name.toString(),
                                  location: vila.location.toString(),
                                  price: vila.price,
                                  score: vila.score ?? 0,
                                  image: vila.vilaImages.sliderImage,
                                ),
                              );
                            },
                          ),

                          // All Vila
                          ListView.builder(
                            padding: EdgeInsets.only(left: 30),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.user.allVilas.length,
                            itemBuilder: (context, index) {
                              final vila = state.user.allVilas[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailPage(id: vila.id)));
                                },
                                child: CardCustom(
                                  name: vila.name.toString(),
                                  location: vila.location.toString(),
                                  price: vila.price,
                                  score: vila.score ?? 0,
                                  image: vila.vilaImages.sliderImage,
                                ),
                              );
                            },
                          ),

                          // Popular Vila
                          ListView.builder(
                            padding: EdgeInsets.only(left: 30),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.user.popularVilas.length,
                            itemBuilder: (context, index) {
                              final vila = state.user.popularVilas[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailPage(id: vila.id)));
                                },
                                child: CardCustom(
                                  name: vila.name.toString(),
                                  location: vila.location.toString(),
                                  price: vila.price,
                                  score: vila.score ?? 0,
                                  image: vila.vilaImages.sliderImage,
                                ),
                              );
                            },
                          ),

                          // Rating Vila
                          ListView.builder(
                            padding: EdgeInsets.only(left: 30),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.user.recommendVilas.length,
                            itemBuilder: (context, index) {
                              final vila = state.user.recommendVilas[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailPage(id: vila.id)));
                                },
                                child: CardCustom(
                                  name: vila.name.toString(),
                                  location: vila.location.toString(),
                                  price: vila.price,
                                  score: vila.score ?? 0,
                                  image: vila.vilaImages.sliderImage,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'for_you'.tr(),
                                  style: blackTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  final vila = state.user.allVilas[index];
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPage(id: vila.id)));
                                      },
                                      child: ForYouCard(vila: vila));
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                } else if (state is HomeLoading) {
                  return ShimmerTabCard();
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
