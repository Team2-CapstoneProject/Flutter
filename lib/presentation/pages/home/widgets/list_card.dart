import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:easy_localization/easy_localization.dart';

class CardCustom extends StatelessWidget {
  final String name;
  final String location;
  final int price;
  final double score;
  final String image;

  const CardCustom({
    Key? key,
    required this.name,
    required this.location,
    required this.price,
    required this.score,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalStars = 5;
    int filledStars = (score / 2).floor();
    double remainingScore = score - (filledStars * 2);
    bool hasHalfStar = remainingScore >= 1;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: grey2Color,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
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
                          text: Utils.currencyFormat(price),
                          style: whiteTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ' night'.tr(),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (int i = 0; i < filledStars; i++)
                        Icon(
                          Iconsax.star1,
                          color: yellowColor,
                          size: 25,
                        ),
                      if (hasHalfStar)
                        Icon(
                          Iconsax.star_11,
                          color: yellowColor,
                          size: 25,
                        ),
                      for (int i = 0;
                          i < totalStars - filledStars - (hasHalfStar ? 1 : 0);
                          i++)
                        Icon(
                          Iconsax.star,
                          color: yellowColor,
                          size: 25,
                        ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        score.toString(),
                        style: whiteTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 17.0,
            right: 17.0,
            child: Icon(
              Iconsax.archive_1,
              color: darkGrey,
              size: 28.0,
            ),
          ),
        ],
      ),
    );
  }
}
