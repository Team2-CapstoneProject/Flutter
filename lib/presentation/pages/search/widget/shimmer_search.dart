import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSearch extends StatelessWidget {
  const ShimmerSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 15, bottom: 20, left: 30, right: 30),
      child: Shimmer.fromColors(
        baseColor: white70Color,
        highlightColor: grey95,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              height: 145,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: grey95,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              height: 145,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: grey95,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              height: 145,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: grey95,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              height: 145,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: grey95,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
