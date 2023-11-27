import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomSearch extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const CustomSearch({
    Key? key,
    required this.controller,
    this.onChanged,
    // required this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.only(bottom: 30),
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
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Iconsax.search_normal,
              color: currentTheme ? white70Color : greyColor,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: TextField(
                onChanged: onChanged,
                controller: controller,
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 14, fontWeight: regular)
                    : greyTextStyle.copyWith(fontSize: 14, fontWeight: regular),
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
