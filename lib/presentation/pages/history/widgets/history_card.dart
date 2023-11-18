import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/common/utils.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_separator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HistoryCard extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final int price;
  final VoidCallback onViewPressed;
  const HistoryCard(
      {super.key,
      required this.image,
      required this.name,
      required this.location,
      required this.price,
      required this.onViewPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      margin: EdgeInsets.only(bottom: 30),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: grey95,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          left: 18,
          right: 18,
          bottom: 12,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 107,
                  width: 105,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(19),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text(
                                name,
                                style: blackTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: medium,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Iconsax.location,
                                  size: 12,
                                  color: darkGrey,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Flexible(
                                  child: Text(
                                    location,
                                    style: blackTextStyle.copyWith(
                                      fontSize: 10,
                                      fontWeight: light,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: Utils.currencyFormat(
                                        price,
                                      ),
                                      style: darkGreyTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: medium,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' /night'.tr(),
                                      style: darkGreyTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: light,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                top: 6,
                bottom: 14,
              ),
              child: MySeparator(
                height: 1,
                color: whiteColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 34,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'cancel_booking'.tr(),
                      style: darkGreyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 34,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                    onPressed: onViewPressed,
                    child: Text(
                      'view'.tr(),
                      style: whiteTextStyle.copyWith(
                          fontSize: 12, fontWeight: medium),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
