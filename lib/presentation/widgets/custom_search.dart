import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomSearch extends StatelessWidget {
  final ValueChanged<String> onFieldSubmitted;
  final TextEditingController controller;

  const CustomSearch(
      {Key? key, required this.onFieldSubmitted, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              color: greyColor,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: TextField(
                onSubmitted: onFieldSubmitted,
                controller: controller,
                style: greyTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 14,
                ),
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
