import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const CustomListTile(
      {super.key, required this.icon, required this.text, required this.onTap});

  get currentTheme => null;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: (icon == Iconsax.logout ? redCandy : greyColor),
        size: 24,
      ),
      title: Text(
        text,
        style: GoogleFonts.poppins(
          color: text == 'Logout' ? redCandy : blackColor,
          fontSize: 14,
          fontWeight: regular,
        ),
      ),
      onTap: onTap,
      hoverColor: greyColor,
      minLeadingWidth: 15,
    );
  }
}
