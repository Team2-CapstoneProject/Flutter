import 'package:capstone_project_villa/presentation/bloc/theme/theme_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/history/history_page.dart';
import 'package:capstone_project_villa/presentation/pages/home/home_page.dart';
import 'package:capstone_project_villa/presentation/pages/profile/profile_page.dart';
import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/presentation/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavbarPage extends StatefulWidget {
  static const String routeName = '/bottomNavbar';

  const BottomNavbarPage({super.key});

  @override
  State<BottomNavbarPage> createState() => _BottomNavbarPageState();
}

class _BottomNavbarPageState extends State<BottomNavbarPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    HistoryPage(),
    ProfilePage()
  ];

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    int tabIndex = ModalRoute.of(context)?.settings.arguments as int? ?? 0;
    changeTab(tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      ThemeData currentTheme =
          (state is ThemeUpdated) ? state.themeData : ThemeData.light();
      return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          height: 94,
          color: currentTheme == ThemeData.light()
              ? whiteColor
              : Color(0xff1E1E1E),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GNav(
            gap: 6,
            activeColor:
                currentTheme == ThemeData.light() ? darkGrey : whiteColor,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: currentTheme == ThemeData.light()
                ? const Color(0xFF539DF3).withOpacity(0.37)
                : darkGrey,
            color: darkGrey,
            tabs: [
              GButton(
                icon: Iconsax.home,
                text: 'Home',
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                textStyle: currentTheme == ThemeData.light()
                    ? primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium)
                    : whiteTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                iconColor: currentTheme == ThemeData.light()
                    ? primaryColor
                    : whiteColor,
              ),
              GButton(
                icon: Iconsax.search_normal_1,
                text: 'Search',
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                textStyle: currentTheme == ThemeData.light()
                    ? primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium)
                    : whiteTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                iconColor: currentTheme == ThemeData.light()
                    ? primaryColor
                    : whiteColor,
              ),
              GButton(
                icon: Iconsax.note,
                text: 'History',
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                textStyle: currentTheme == ThemeData.light()
                    ? primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium)
                    : whiteTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                iconColor: currentTheme == ThemeData.light()
                    ? primaryColor
                    : whiteColor,
              ),
              GButton(
                icon: Iconsax.user,
                text: 'Profile',
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                textStyle: currentTheme == ThemeData.light()
                    ? primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium)
                    : whiteTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                iconColor: currentTheme == ThemeData.light()
                    ? primaryColor
                    : whiteColor,
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      );
    });
  }
}
