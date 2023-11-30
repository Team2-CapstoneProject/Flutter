import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/common/utils.dart';
import 'package:capstone_project_villa/data/models/request/bookmark_request_model.dart';
import 'package:capstone_project_villa/presentation/bloc/bookmark/bookmark_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:easy_localization/easy_localization.dart';

class CardCustom extends StatefulWidget {
  final int id;
  final String name;
  final String location;
  final int price;
  final double score;
  final String image;
  final bool isBookmarked;

  const CardCustom({
    Key? key,
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.score,
    required this.image,
    required this.isBookmarked,
  }) : super(key: key);

  @override
  State<CardCustom> createState() => _CardCustomState();
}

class _CardCustomState extends State<CardCustom> {
  bool? isBookmarkedState;

  @override
  void initState() {
    print('state bookmark: ' + isBookmarkedState.toString());
    isBookmarkedState = widget.isBookmarked;
    print('a state bookmark: ' + isBookmarkedState.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int totalStars = 5;
    int filledStars = (widget.score / 2).floor();
    double remainingScore = widget.score - (filledStars * 2);
    bool hasHalfStar = remainingScore >= 1;
    // bool currentTheme = Theme.of(context).brightness == Brightness.dark;

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
                image: NetworkImage(widget.image),
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
                    widget.name.toString(),
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
                          widget.location.toString(),
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
                          text: Utils.currencyFormat(widget.price),
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
                        widget.score.toString(),
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
            child: GestureDetector(
              onTap: () {
                context.read<BookmarkBloc>().add(
                      ToggleBookmarkEvent(
                        BookmarkRequestModel(id: widget.id),
                      ),
                    );
                setState(() {
                  isBookmarkedState = !isBookmarkedState!;
                });
              },
              child: Icon(
                isBookmarkedState!
                    // widget.isBookmarked
                    ? Iconsax.archive_tick1
                    : Iconsax.archive_1,
                color: darkGrey,
                size: 28.0,
              ),
            ),
            // child: BlocConsumer<BookmarkBloc, BookmarkState>(
            //   listener: (context, state) {
            //     print('masuk 1: ' + state.toString());
            //     // if (state is ToggleBookmarkSuccess) {
            //     // Navigator.pushReplacement(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //     builder: (context) => BottomNavbarPage(),
            //     //   ),
            //     // );
            //     // Navigator.pop(context);
            //     setState(() {
            //       isBookmarkedState = !isBookmarkedState!;
            //     });
            //     // }
            //   },
            //   builder: (context, state) {
            //     return GestureDetector(
            //       onTap: () {
            //         context.read<BookmarkBloc>().add(
            //               ToggleBookmarkEvent(
            //                 BookmarkRequestModel(id: widget.id),
            //               ),
            //             );
            //       },
            //       child: Icon(
            //         isBookmarkedState!
            //             // widget.isBookmarked
            //             ? Iconsax.archive_tick1
            //             : Iconsax.archive_1,
            //         color: darkGrey,
            //         size: 28.0,
            //       ),
            //     );
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}
