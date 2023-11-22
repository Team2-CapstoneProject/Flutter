import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewFormWidget extends StatefulWidget {
  @override
  State<ReviewFormWidget> createState() => _ReviewFormWidgetState();
}

class _ReviewFormWidgetState extends State<ReviewFormWidget> {
  double selectedRating = 0;
  @override
  Widget build(BuildContext context) {
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
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
            ),
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
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
            ),
          ),
          TextFormField(
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.done,
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

          CustomButton(onPressed: () {}, text: 'Done')
        ],
      ),
    );
  }
}
