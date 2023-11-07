import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CardCustom extends StatelessWidget {
  final String? name;
  final String? location;
  final int? price;
  final double? score;

  const CardCustom({
    Key? key,
    this.name,
    this.location,
    this.price,
    this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: redCandy,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, bottom: 18),
            width: 206,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Icon(
                      Iconsax.location,
                      color: whiteColor,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      child: Text(
                        location.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: whiteTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Rp $price',
                        style: whiteTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' /night',
                        style: whiteTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Icon(
                      Iconsax.star,
                      color: whiteColor,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      score.toString(),
                      style: whiteTextStyle,
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 17.0,
            right: 17.0,
            child: Icon(
              Iconsax.archive_1,
              color: whiteColor,
              size: 28.0,
            ),
          ),
        ],
      ),
    );
  }
}
