import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/common/utils.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_separator.dart';
import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class HistoryTicket extends StatelessWidget {
  final String name;
  final DateTime checkIn;
  final DateTime checkOut;
  final int guest;
  final int taxes;
  final int night;
  final int total;
  const HistoryTicket(
      {super.key,
      required this.taxes,
      required this.night,
      required this.total,
      required this.name,
      required this.checkIn,
      required this.checkOut,
      required this.guest});

  @override
  Widget build(BuildContext context) {
    return TicketWidget(
      color: grey95,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      isCornerRounded: true,
      width: MediaQuery.of(context).size.width,
      height: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Name',
                style: darkGreyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
              Text(
                name,
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          // Check In
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Check In',
                style: darkGreyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
              Text(
                Utils.dateTimeFormat4(checkIn),
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              )
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          // Check Out
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Check Out',
                style: darkGreyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
              Text(
                Utils.dateTimeFormat4(checkOut),
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              )
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          // Guest
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Guest',
                style: darkGreyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
              Text(
                guest.toString(),
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          MySeparator(height: 3, color: whiteColor),
          const SizedBox(
            height: 30.0,
          ),
          // Taxes
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
              Text(
                Utils.currencyFormat2(night),
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              )
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          // Night
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
              Text(
                Utils.currencyFormat2(night),
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              )
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          // Total
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
              Text(
                Utils.currencyFormat2(total),
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
