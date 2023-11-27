import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/common/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:capstone_project_villa/data/models/response/detail_response_model.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class DetaikSeeAllReviewPage extends StatelessWidget {
  final List<Transaction> transactions;
  const DetaikSeeAllReviewPage({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
          statusBarIconBrightness:
              currentTheme ? Brightness.light : Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: currentTheme ? whiteColor : darkGrey,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            transactions.isEmpty
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Center(
                      child: Text('No reviews available').tr(),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final review = transactions[index].reviews;
                      final users = transactions[index].users;

                      if (review.isNotEmpty) {
                        return Column(
                          children: [
                            Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(bottom: 30),
                              decoration: BoxDecoration(
                                color: grey95,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: grey95),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(users.image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            child: Text(
                                              users.fullname,
                                              style: blackTextStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: bold,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Iconsax.star1,
                                                size: 16,
                                                color: yellowColor,
                                              ),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              Container(
                                                child: Text(
                                                  review[0].score.toString(),
                                                  style: greyTextStyle.copyWith(
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Flexible(
                                            child: Container(
                                              child: Text(
                                                review[0].description,
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: regular),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.justify,
                                                maxLines: 3,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              Utils.dateTimeFormatCustom(
                                                  review[0].updatedAt),
                                              style: grey100kTextStyle.copyWith(
                                                  fontSize: 10),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      }
                      return SizedBox();
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
