import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/models/request/review_request_model.dart';
import 'package:capstone_project_villa/data/models/response/history_transaction_response_model.dart';
import 'package:capstone_project_villa/presentation/bloc/history/history_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/navbar/bottom_navbar.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewFormWidget extends StatefulWidget {
  final HistoryTransactionResponseModel reviewId;

  const ReviewFormWidget({super.key, required this.reviewId});

  @override
  State<ReviewFormWidget> createState() => _ReviewFormWidgetState();
}

class _ReviewFormWidgetState extends State<ReviewFormWidget> {
  final _reviewController = TextEditingController();
  double selectedRating = 0;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 500,
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              'Give ratings',
              style: currentTheme
                  ? whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold)
                  : blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
            ).tr(),
          ),

          // Rating
          RatingBar.builder(
            maxRating: 10,
            allowHalfRating: true,
            direction: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, _) => Icon(
              Icons.star_rounded,
              color: yellowColor,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                final double roundedRating = (rating * 2).roundToDouble() / 2;
                selectedRating =
                    (roundedRating * 2).toInt().clamp(1, 10).toDouble();
              });
            },
          ),
          // Container(
          //   margin: EdgeInsets.only(bottom: 25),
          //   child: Text(selectedRating.toString()),
          // ),
          Container(
            margin: EdgeInsets.only(bottom: 20, top: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Leave Review',
              style: currentTheme
                  ? whiteTextStyle.copyWith(fontSize: 14, fontWeight: medium)
                  : blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
            ).tr(),
          ),
          TextFormField(
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.done,
            controller: _reviewController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding:
                  EdgeInsets.only(left: 20, top: 20, bottom: 100, right: 20),
              hintText: "Write a review here",
              isCollapsed: true,
            ),
            maxLines: 4,
            maxLength: 130,
          ),
          const SizedBox(
            height: 15.0,
          ),

          BlocConsumer<HistoryBloc, HistoryState>(listener: (context, state) {
            if (state is HistoryReviewLoaded) {
              setState(() {
                isLoading = false;
              });
              Navigator.pushReplacementNamed(
                context,
                BottomNavbarPage.routeName,
              );
            } else if (state is HistoryLoading) {
              setState(() {
                isLoading = true;
              });
            }
          }, builder: (context, state) {
            return isLoading
                ? CircularProgressIndicator()
                : CustomButton(
                    onPressed: () {
                      final reviewModel = ReviewRequestModel(
                        transactionId: widget.reviewId.id,
                        score: selectedRating.toInt(),
                        description: _reviewController.text,
                      );

                      // print(reviewModel);

                      context.read<HistoryBloc>().add(
                            HistoryReviewEvent(
                              review: reviewModel,
                            ),
                          );
                    },
                    text: 'Done');
          })
        ],
      ),
    );
  }
}
