import 'package:capstone_project_villa/presentation/pages/home/home_page.dart';
import 'package:capstone_project_villa/presentation/pages/profile/profile_page.dart';
import 'package:capstone_project_villa/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavbarPage extends StatefulWidget {
  const BottomNavbarPage({super.key});

  @override
  State<BottomNavbarPage> createState() => _BottomNavbarPageState();
}

class _BottomNavbarPageState extends State<BottomNavbarPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Booking Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        height: 94,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GNav(
          gap: 6,
          activeColor: darkerGrey,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: const Color(0xFF539DF3).withOpacity(0.37),
          color: darkerGrey,
          tabs: [
            GButton(
              icon: Iconsax.home,
              text: 'Home',
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              textStyle:
                  primaryTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              iconColor: primaryColor,
            ),
            GButton(
              icon: Iconsax.search_normal_1,
              text: 'Search',
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              iconColor: primaryColor,
            ),
            GButton(
              icon: Iconsax.note,
              text: 'History',
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              iconColor: primaryColor,
            ),
            GButton(
              icon: Iconsax.user,
              text: 'Profile',
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              iconColor: primaryColor,
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
  }
}
