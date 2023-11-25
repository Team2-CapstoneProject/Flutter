import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/common/utils.dart';
import 'package:capstone_project_villa/presentation/pages/detail/widgets/detail_date_page.dart';
import 'package:capstone_project_villa/presentation/pages/detail/widgets/detail_see_all_page.dart';
import 'package:capstone_project_villa/presentation/pages/detail/widgets/detail_see_all_review_page.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_button.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_circular.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:capstone_project_villa/presentation/bloc/detail/detail_vila_bloc.dart';
import 'package:iconsax/iconsax.dart';

class DetailPage extends StatefulWidget {
  final int id;
  static const String routeName = '/detail';
  const DetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isExpanded = false;
  @override
  void initState() {
    context.read<DetailVilaBloc>().add(GetDetailEvent(id: widget.id));
    super.initState();
  }

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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          BlocBuilder<DetailVilaBloc, DetailVilaState>(
            builder: (context, state) {
              if (state is DetailVilaLoaded) {
                final details = state.detail.vila;
                final facilities = state.detail.vila[0].vilaFacilities;
                final transaction = state.detail.vila[0].transactions;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: details.isNotEmpty &&
                                  details[0].vilaImages.isNotEmpty &&
                                  details[0]
                                      .vilaImages[0]
                                      .sliderImage
                                      .isNotEmpty
                              ? NetworkImage(
                                  details[0].vilaImages[0].sliderImage,
                                )
                              : NetworkImage(
                                  'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(
                          top: 30, right: 30, left: 30, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name Vila
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Text(
                              details[0].name,
                              style: currentTheme
                                  ? whiteTextStyle.copyWith(
                                      fontSize: 24, fontWeight: semiBold)
                                  : blackTextStyle.copyWith(
                                      fontSize: 24, fontWeight: semiBold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          // Location Vila
                          Text(
                            details[0].location,
                            style: currentTheme
                                ? whiteTextStyle.copyWith(
                                    fontSize: 14, fontWeight: light)
                                : greyTextStyle.copyWith(
                                    fontSize: 14, fontWeight: light),
                            overflow: TextOverflow.ellipsis,
                          ),

                          // Divider
                          Divider(
                            color: currentTheme ? cyanBlue : white70Color,
                          ),

                          // Slider Image
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'gallery_photos'.tr(),
                                      style: currentTheme
                                          ? whiteTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: semiBold)
                                          : blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: semiBold),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailSeeAllPage(
                                              galleryPhotos: details[0]
                                                  .vilaImages
                                                  .map((image) =>
                                                      image.sliderImage)
                                                  .toList(),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'see_all'.tr(),
                                        style: currentTheme
                                            ? whiteTextStyle.copyWith(
                                                fontSize: 12, fontWeight: light)
                                            : blackTextStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: light),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 105,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: details[0].vilaImages.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            details[0]
                                                .vilaImages[index]
                                                .sliderImage,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),

                          // Descriptions Vila
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'description'.tr(),
                                  style: currentTheme
                                      ? whiteTextStyle.copyWith(
                                          fontSize: 14, fontWeight: medium)
                                      : blackTextStyle.copyWith(
                                          fontSize: 14, fontWeight: medium),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                isExpanded
                                    ? Text(
                                        details.isNotEmpty &&
                                                details[0]
                                                    .description
                                                    .isNotEmpty
                                            ? details[0].description
                                            : 'no_description_available'.tr(),
                                        textAlign: TextAlign.justify,
                                        style: currentTheme
                                            ? whiteTextStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: regular)
                                            : greyTextStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: regular),
                                      )
                                    : Text(
                                        details.isNotEmpty &&
                                                details[0]
                                                    .description
                                                    .isNotEmpty
                                            ? (details[0].description.length >
                                                    137
                                                ? details[0]
                                                        .description
                                                        .substring(0, 137) +
                                                    '...'
                                                : details[0].description)
                                            : 'no_description_available'.tr(),
                                        textAlign: TextAlign.justify,
                                        style: currentTheme
                                            ? whiteTextStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: regular)
                                            : greyTextStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: regular),
                                      ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isExpanded = !isExpanded;
                                        });
                                      },
                                      child: Text(
                                        isExpanded
                                            ? 'see_less'.tr()
                                            : 'see_more'.tr(),
                                        style: currentTheme
                                            ? whiteTextStyle.copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 12,
                                                fontWeight: bold)
                                            : primaryTextStyle.copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 12,
                                                fontWeight: bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Facilities Vila
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'facilities'.tr(),
                                  style: currentTheme
                                      ? whiteTextStyle.copyWith(
                                          fontSize: 14, fontWeight: medium)
                                      : blackTextStyle.copyWith(
                                          fontSize: 14, fontWeight: medium),
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemCount: facilities.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child: Column(
                                        children: [
                                          Image.network(
                                            facilities[index].facilities.icon,
                                            width: 28,
                                            height: 28,
                                            color: currentTheme
                                                ? grey100
                                                : primaryColor,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            facilities[index].facilities.label,
                                            style: currentTheme
                                                ? whiteTextStyle.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: light)
                                                : primaryTextStyle.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: light),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),

                          // Review Vila
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'reviews'.tr(),
                                    style: currentTheme
                                        ? whiteTextStyle.copyWith(
                                            fontSize: 14, fontWeight: medium)
                                        : greyTextStyle.copyWith(
                                            fontSize: 14, fontWeight: medium),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetaikSeeAllReviewPage(
                                            transactions: transaction,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'see_all'.tr(),
                                      style: currentTheme
                                          ? whiteTextStyle.copyWith(
                                              fontSize: 12, fontWeight: light)
                                          : primaryTextStyle.copyWith(
                                              fontSize: 12, fontWeight: light),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              if (transaction.any((t) => t.reviews.isNotEmpty))
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: transaction.length > 3
                                      ? 3
                                      : transaction.length,
                                  itemBuilder: (context, transactionIndex) {
                                    final users =
                                        transaction[transactionIndex].users;
                                    final reviews =
                                        transaction[transactionIndex]
                                            .reviews
                                            .toList();

                                    if (reviews.isNotEmpty) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: reviews.map((review) {
                                          return Container(
                                            margin: EdgeInsets.only(bottom: 20),
                                            height: 135,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: grey95,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, top: 22, right: 24),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: 20),
                                                        width: 40,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                                users.image),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            users.fullname,
                                                            style:
                                                                blackTextStyle
                                                                    .copyWith(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  semiBold,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          Text(
                                                            Utils.dateTimeFormat3(
                                                                review
                                                                    .updatedAt),
                                                            style: greyTextStyle
                                                                .copyWith(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  regular,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        width: 65,
                                                        height: 35,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Iconsax.star1,
                                                              color:
                                                                  yellowColor,
                                                            ),
                                                            const SizedBox(
                                                                width: 3.0),
                                                            Text(
                                                              review.score
                                                                  .toString(),
                                                              style:
                                                                  whiteTextStyle
                                                                      .copyWith(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    semiBold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    child: Text(
                                                      review.description,
                                                      maxLines: 3,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: blackTextStyle
                                                          .copyWith(
                                                        fontSize: 12,
                                                        fontWeight: regular,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      );
                                    }
                                    return SizedBox();
                                  },
                                )
                              else
                                Text(
                                  'no reviews for any transaction'.tr(),
                                ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else if (state is DetailVilaLoading) {
                return CustomCircular();
              }
              return SizedBox();
            },
          ),
        ],
      ),
      bottomNavigationBar: BlocBuilder<DetailVilaBloc, DetailVilaState>(
        builder: (context, state) {
          if (state is DetailVilaLoaded) {
            final vila = state.detail.vila[0];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: MediaQuery.of(context).size.height * 0.16,
              color:
                  currentTheme ? Color.fromARGB(255, 20, 20, 20) : whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: RichText(
                      text: TextSpan(
                        style: currentTheme
                            ? whiteTextStyle.copyWith(
                                fontSize: 24, fontWeight: semiBold)
                            : blueBlackTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: semiBold,
                              ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${Utils.currencyFormat(vila.price)} ',
                          ),
                          TextSpan(
                            text: 'night'.tr(),
                            style: currentTheme
                                ? whiteTextStyle.copyWith(
                                    fontSize: 16, fontWeight: regular)
                                : grey100kTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: regular,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailDatePage(
                              vilas: vila,
                            ),
                          ),
                        );
                      },
                      text: 'book_now'.tr())
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
