import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CustomSecurityCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final String subText;
  final VoidCallback onTap;

  const CustomSecurityCard(
      {super.key,
      required this.icon,
      required this.text,
      required this.onTap,
      required this.subText});

  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        leading: Icon(
          icon,
          color:
              (icon == Iconsax.logout && !currentTheme) ? redCandy : greyColor,
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
        subtitle: Text(
          subText,
          style: GoogleFonts.poppins(
            color: currentTheme ? Colors.grey : blackColor,
            fontSize: 12,
            fontWeight: regular,
          ),
        ),
        onTap: onTap,
        hoverColor: greyColor,
        minLeadingWidth: 15,
      ),
    );
  }
}
