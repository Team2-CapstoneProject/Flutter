import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';

class ShimmerProfile extends StatelessWidget {
  const ShimmerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 76, bottom: 29),
          width: 152,
          height: 152,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: white70Color),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5),
          width: 106,
          height: 36,
          decoration: BoxDecoration(color: white70Color),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          width: 147,
          height: 21,
          decoration: BoxDecoration(color: white70Color),
        ),
        for (int i = 0; i < 7; i++) _buildShimmerTile(),
      ],
    );
  }

  Widget _buildShimmerTile() {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: ListTile(
        leading: Container(
          width: 24,
          height: 24,
          color: white70Color,
        ),
        title: Container(
          height: 21,
          decoration: BoxDecoration(color: white70Color),
        ),
      ),
    );
  }
}
