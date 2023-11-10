import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/common/utils.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_button.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_circular.dart';
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: whiteColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(color: darkGrey),
      ),
      body: ListView(
        children: [
          BlocBuilder<DetailVilaBloc, DetailVilaState>(
            builder: (context, state) {
              if (state is DetailVilaLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image
                          Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  state
                                      .detail.vila[0].vilaImages[0].sliderImage,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(
                              top: 30,
                              left: 30,
                              right: 30,
                              bottom: 30,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Name Vila
                                Text(
                                  state.detail.vila[0].name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 24,
                                    fontWeight: semiBold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(
                                  height: 5.0,
                                ),

                                // Location Vila
                                Text(
                                  state.detail.vila[0].location,
                                  style: greyTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: light,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),

                                // Divider
                                Divider(
                                  color: white70Color,
                                ),

                                const SizedBox(
                                  height: 20.0,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Gallery Photos',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                    Text('See All')
                                  ],
                                ),

                                const SizedBox(
                                  height: 20.0,
                                ),

                                Container(
                                  height: 105,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        state.detail.vila[0].vilaImages.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(right: 10),
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              state
                                                  .detail
                                                  .vila[0]
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

                                const SizedBox(
                                  height: 20.0,
                                ),

                                // Descriptions Vila
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Description',
                                        style: blackTextStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: medium,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      isExpanded
                                          ? Text(
                                              state.detail.vila[0].description,
                                              textAlign: TextAlign.justify,
                                              style: greyTextStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: regular,
                                              ),
                                            )
                                          : Text(
                                              state.detail.vila[0].description
                                                      .substring(0, 137) +
                                                  '...',
                                              textAlign: TextAlign.justify,
                                              style: greyTextStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: regular,
                                              ),
                                            ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isExpanded = !isExpanded;
                                              });
                                            },
                                            child: Text(
                                              isExpanded
                                                  ? 'See Less'
                                                  : 'See More',
                                              style: primaryTextStyle.copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 12,
                                                fontWeight: bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  height: 25.0,
                                ),

                                // Facilities Vila
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Facilities',
                                        style: blackTextStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: medium,
                                        ),
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
                                        itemCount: state.detail.vila[0]
                                            .vilaFacilities.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: Column(
                                              children: [
                                                Image.network(
                                                  state
                                                      .detail
                                                      .vila[0]
                                                      .vilaFacilities[index]
                                                      .facilities
                                                      .icon,
                                                  width: 28,
                                                  height: 28,
                                                  color: primaryColor,
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  state
                                                      .detail
                                                      .vila[0]
                                                      .vilaFacilities[index]
                                                      .facilities
                                                      .label,
                                                  style:
                                                      primaryTextStyle.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: light,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  height: 25.0,
                                ),

                                // Review Vila
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Reviews',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: medium,
                                          ),
                                        ),
                                        Text(
                                          'See All',
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: light,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Container(
                                      height: 135,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: grey95,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          top: 22,
                                          right: 24,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        state
                                                            .detail
                                                            .vila[0]
                                                            .transactions[0]
                                                            .users
                                                            .image,
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20.0,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      state
                                                          .detail
                                                          .vila[0]
                                                          .transactions[0]
                                                          .users
                                                          .fullname,
                                                      style: blackTextStyle
                                                          .copyWith(
                                                        fontSize: 16,
                                                        fontWeight: semiBold,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Text(
                                                      Utils.dateTimeFormat3(
                                                        state
                                                            .detail
                                                            .vila[0]
                                                            .transactions[0]
                                                            .reviews[0]
                                                            .updatedAt,
                                                      ),
                                                      style: greyTextStyle
                                                          .copyWith(
                                                        fontSize: 14,
                                                        fontWeight: regular,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Container(
                                                  width: 65,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      20,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Iconsax.star1,
                                                        color: yellowColor,
                                                      ),
                                                      const SizedBox(
                                                        width: 3.0,
                                                      ),
                                                      Text(
                                                        state
                                                            .detail
                                                            .vila[0]
                                                            .transactions[0]
                                                            .reviews[0]
                                                            .score
                                                            .toString(),
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                          fontSize: 14,
                                                          fontWeight: semiBold,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              state
                                                  .detail
                                                  .vila[0]
                                                  .transactions[0]
                                                  .reviews[0]
                                                  .description,
                                              maxLines: 3,
                                              textAlign: TextAlign.justify,
                                              overflow: TextOverflow.ellipsis,
                                              style: blackTextStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: regular,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
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
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: MediaQuery.of(context).size.height * 0.16,
              color: whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12.0,
                  ),
                  RichText(
                    text: TextSpan(
                      style: blueBlackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '${Utils.currencyFormat(state.detail.vila[0].price)} ',
                        ),
                        TextSpan(
                          text: '/night',
                          style: grey100kTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  CustomButton(onPressed: () {}, text: 'Book Now')
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
