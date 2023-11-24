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

  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      leading: Icon(
        icon,
        color: (icon == Iconsax.logout && !currentTheme) ? redCandy : greyColor,
        size: 24,
      ),
      title: Text(
        text,
        style: GoogleFonts.poppins(
          color: (text == 'Logout')
              ? redCandy
              : (currentTheme ? Colors.white : blackColor),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      hoverColor: greyColor,
      minLeadingWidth: 15,
    );
  }
}
