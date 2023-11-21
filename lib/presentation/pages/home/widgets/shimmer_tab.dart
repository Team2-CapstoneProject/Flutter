import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';

class ShimmerTabCard extends StatelessWidget {
  const ShimmerTabCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30, left: 30, right: 30),
          height: 23,
          width: MediaQuery.of(context).size.width,
          color: white70Color,
        ),
        Container(
          height: 300,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 30, bottom: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: white70Color,
                child: Container(
                  padding: EdgeInsets.only(left: 16, bottom: 18),
                  height: 300,
                  width: 206,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 21,
                    width: 52,
                    color: white70Color,
                  ),
                  Container(
                    height: 21,
                    width: 52,
                    color: white70Color,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30, top: 20),
                height: 145,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: white70Color,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
