import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/presentation/pages/profile/widgets/custom_security_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SecurityPage extends StatelessWidget {
  static const String routeName = '/security';
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Security',
          style: currentTheme
              ? whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold)
              : blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 24,
            color: currentTheme ? whiteColor : greyColor,
          ),
        ),
        backgroundColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              CustomSecurityCard(
                icon: Iconsax.notification,
                text: 'Push Notification',
                onTap: () {},
                subText:
                    'Setting your notification permission and get a promo or update notification',
              ),
              CustomSecurityCard(
                icon: Iconsax.lock,
                text: 'App Permissions',
                onTap: () {},
                subText: 'Manage app permissions and access',
              ),
              CustomSecurityCard(
                icon: Iconsax.info_circle,
                text: 'App Version',
                onTap: () {},
                subText: 'Check the current version and updates',
              ),
              CustomSecurityCard(
                icon: Iconsax.security_user,
                text: 'Privacy Settings',
                onTap: () {},
                subText: 'Manage your privacy and data settings',
              ),
              CustomSecurityCard(
                icon: Iconsax.fatrows,
                text: 'App Customization',
                onTap: () {},
                subText: 'Customize app appearance and preferences',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
