import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/presentation/pages/authentication/login_page.dart';
import 'package:capstone_project_villa/presentation/pages/profile/widgets/edit_profile_page.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_dialog.dart';
import 'package:capstone_project_villa/presentation/pages/profile/widgets/custom_list_tile.dart';
import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 76, bottom: 29),
              width: 152,
              height: 152,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/profile/image.png'),
                ),
              ),
            ),
            Text(
              'Aezakmi',
              style:
                  blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              'aezakmi@gmail.com',
              style: greyTextStyle.copyWith(fontSize: 14, fontWeight: light),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Divider(
              color: white70Color,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  CustomListTile(
                    icon: Iconsax.user,
                    text: 'Edit Profile',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfilePage(),
                        ),
                      );
                    },
                  ),
                  CustomListTile(
                    icon: Iconsax.frame_4,
                    text: 'Security',
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => const CustomDialog(),
                      );
                    },
                  ),
                  CustomListTile(
                    icon: Iconsax.info_circle,
                    text: 'Help',
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => const CustomDialog(),
                      );
                    },
                  ),
                  CustomListTile(
                    icon: Iconsax.translate,
                    text: 'Language',
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => const CustomDialog(),
                      );
                    },
                  ),
                  CustomListTile(
                    icon: Iconsax.eye,
                    text: 'Dark Theme',
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => const CustomDialog(),
                      );
                    },
                  ),
                  CustomListTile(
                    icon: Iconsax.logout,
                    text: 'Logout',
                    onTap: () async {
                      await AuthLocalDataSource().removeToken();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        LoginPage.routeName,
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
