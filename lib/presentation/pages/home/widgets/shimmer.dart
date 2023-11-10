import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 20, left: 30, right: 30),
      child: Shimmer.fromColors(
        baseColor: white70Color,
        highlightColor: grey95,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shimmer Text Nickname
            Container(
              height: 24,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),

            // Shimmer Search Button
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),

            // Shimmer Category Icon
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: grey95,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 18,
                        width: 26,
                        color: grey95,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: grey95,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 18,
                        width: 26,
                        color: grey95,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: grey95,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 18,
                        width: 26,
                        color: grey95,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: grey95,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 18,
                        width: 26,
                        color: grey95,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
