import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/common/utils.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_separator.dart';
import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class CustomTicket extends StatelessWidget {
  final int taxes;
  final int night;
  final int total;
  const CustomTicket(
      {super.key,
      required this.taxes,
      required this.night,
      required this.total});

  @override
  Widget build(BuildContext context) {
    return TicketWidget(
      color: grey95,
      padding: EdgeInsets.all(25),
      isCornerRounded: true,
      width: MediaQuery.of(context).size.width,
      height: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Check In',
                style: darkGreyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            'Check Out',
            style: darkGreyTextStyle.copyWith(
              fontSize: 12,
              fontWeight: light,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              Text(
                'Guest',
                style: darkGreyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
              // Text()
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          MySeparator(height: 3, color: whiteColor),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Taxes 5%',
                style: darkGreyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
              Text(Utils.currencyFormat2(night))
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Night',
                style: darkGreyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
              Text(Utils.currencyFormat2(night))
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: darkGreyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
              Text(Utils.currencyFormat2(total))
            ],
          ),
        ],
      ),
    );
  }
}
