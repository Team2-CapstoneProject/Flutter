import 'package:capstone_project_villa/presentation/pages/bookmark/bookmark_page.dart';
import 'package:capstone_project_villa/presentation/pages/category/category_vila_page.dart';
import 'package:capstone_project_villa/presentation/pages/detail/detail_page.dart';
import 'package:capstone_project_villa/presentation/pages/home/widgets/category_card.dart';
import 'package:capstone_project_villa/presentation/pages/home/widgets/foryou_card.dart';
import 'package:capstone_project_villa/presentation/pages/home/widgets/shimmer.dart';
import 'package:capstone_project_villa/presentation/pages/home/widgets/shimmer_tab.dart';
import 'package:capstone_project_villa/presentation/pages/home/widgets/tab_card.dart';
import 'package:capstone_project_villa/presentation/pages/notification/notification_page.dart';
import 'package:capstone_project_villa/presentation/pages/search/search_page.dart';
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
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
      // Headers
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
          statusBarIconBrightness:
              currentTheme ? Brightness.light : Brightness.dark,
        ),
        backgroundColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
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
                    color: currentTheme ? white70Color : darkGrey,
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationPage()));
                  },
                  child: Icon(
                    Iconsax.notification,
                    color: currentTheme ? white70Color : darkGrey,
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
                          style: currentTheme
                              ? whiteTextStyle.copyWith(
                                  fontSize: 24, fontWeight: semiBold)
                              : blackTextStyle.copyWith(
                                  fontSize: 24, fontWeight: semiBold),
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
                                  color:
                                      currentTheme ? white70Color : greyColor,
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'Search',
                                  style: currentTheme
                                      ? whiteTextStyle.copyWith(
                                          fontSize: 14, fontWeight: regular)
                                      : greyTextStyle.copyWith(
                                          fontSize: 14, fontWeight: regular),
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
                                onTap: () {},
                              ),
                              CategoryCard(
                                icon: Iconsax.smart_car,
                                label: 'Travel',
                                onTap: () {},
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
                                                style: currentTheme
                                                    ? whiteTextStyle.copyWith(
                                                        fontSize: 14,
                                                        fontWeight: medium)
                                                    : blackTextStyle.copyWith(
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
                                                  onTap: () {},
                                                ),
                                                CategoryCard(
                                                  icon: Iconsax.smart_car,
                                                  label: 'Travel',
                                                  onTap: () {},
                                                ),
                                                CategoryCard(
                                                  icon: Iconsax.car,
                                                  label: 'Rental',
                                                  onTap: () {},
                                                ),
                                                CategoryCard(
                                                  icon: Iconsax.people,
                                                  label: 'Guide',
                                                  onTap: () {},
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
                                  id: vila.id,
                                  name: vila.name.toString(),
                                  location: vila.location.toString(),
                                  price: vila.price,
                                  score: vila.score.toDouble(),
                                  image: vila.vilaImages.sliderImage,
                                  isBookmarked: vila.isBookmarked,
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
                                  id: vila.id,
                                  name: vila.name.toString(),
                                  location: vila.location.toString(),
                                  price: vila.price,
                                  score: vila.score.toDouble(),
                                  image: vila.vilaImages.sliderImage,
                                  isBookmarked: vila.isBookmarked,
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
                                  id: vila.id,
                                  name: vila.name.toString(),
                                  location: vila.location.toString(),
                                  price: vila.price,
                                  score: vila.score.toDouble(),
                                  image: vila.vilaImages.sliderImage,
                                  isBookmarked: vila.isBookmarked,
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
                                  id: vila.id,
                                  name: vila.name.toString(),
                                  location: vila.location.toString(),
                                  price: vila.price,
                                  score: vila.score.toDouble(),
                                  image: vila.vilaImages.sliderImage,
                                  isBookmarked: vila.isBookmarked,
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
                                  style: currentTheme
                                      ? whiteTextStyle.copyWith(
                                          fontSize: 14, fontWeight: medium)
                                      : darkGreyTextStyle.copyWith(
                                          fontSize: 14, fontWeight: medium),
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
