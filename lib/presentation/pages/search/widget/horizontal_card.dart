import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/common/utils.dart';
import 'package:capstone_project_villa/data/models/response/search_response_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HorizontalCard extends StatelessWidget {
  final Vila vila;

  const HorizontalCard({
    Key? key,
    required this.vila,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 145,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentTheme ? white70Color.withOpacity(0.3) : grey95,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 19),
            height: 107,
            width: 105,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  vila.vilaImages.sliderImage,
                ),
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
                          vila.name,
                          style: currentTheme
                              ? whiteTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium)
                              : blackTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Iconsax.location,
                            size: 12,
                            color: currentTheme
                                ? white70Color.withOpacity(0.5)
                                : darkGrey,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Flexible(
                            child: Text(
                              vila.location,
                              style: currentTheme
                                  ? whiteTextStyle.copyWith(
                                      fontSize: 10, fontWeight: medium)
                                  : blackTextStyle.copyWith(
                                      fontSize: 10, fontWeight: medium),
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
                                  vila.price,
                                ),
                                style: currentTheme
                                    ? whiteTextStyle.copyWith(
                                        fontSize: 14, fontWeight: medium)
                                    : darkGreyTextStyle.copyWith(
                                        fontSize: 14, fontWeight: medium),
                              ),
                              TextSpan(
                                text: ' /night',
                                style: currentTheme
                                    ? whiteTextStyle.copyWith(
                                        fontSize: 14, fontWeight: medium)
                                    : darkGreyTextStyle.copyWith(
                                        fontSize: 14, fontWeight: medium),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Icon(
                      //     Iconsax.archive_1,
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
