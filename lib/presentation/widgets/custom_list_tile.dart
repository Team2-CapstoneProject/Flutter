import 'package:capstone_project_villa/styles/style.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const CustomListTile(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: greyColor,
        size: 24,
      ),
      title: Text(
        text,
        style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
      ),
      onTap: onTap,
      hoverColor: greyColor,
      minLeadingWidth: 15,
    );
  }
}
