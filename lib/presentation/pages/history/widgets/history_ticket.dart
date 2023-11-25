import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/common/utils.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_separator.dart';
import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class HistoryTicket extends StatelessWidget {
  final String name;
  final DateTime checkIn;
  final DateTime checkOut;
  // final int guest;
  final int taxes;
  final int night;
  final int total;
  const HistoryTicket({
    super.key,
    required this.taxes,
    required this.night,
    required this.total,
    required this.name,
    required this.checkIn,
    required this.checkOut,
    // required this.guest,
  });

  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;

    return TicketWidget(
      color: currentTheme ? white70Color.withOpacity(0.3) : grey95,
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
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 12, fontWeight: light)
                    : darkGreyTextStyle.copyWith(
                        fontSize: 12, fontWeight: light),
              ),
              Text(
                name,
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 14, fontWeight: medium)
                    : blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              ),
            ],
          ),
          const SizedBox(
            height: 14.0,
          ),
          // Check In
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Check In',
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 12, fontWeight: light)
                    : darkGreyTextStyle.copyWith(
                        fontSize: 12, fontWeight: light),
              ),
              Text(
                Utils.dateTimeFormat4(checkIn),
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 14, fontWeight: medium)
                    : blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              )
            ],
          ),
          const SizedBox(
            height: 14.0,
          ),
          // Check Out
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Check Out',
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 12, fontWeight: light)
                    : darkGreyTextStyle.copyWith(
                        fontSize: 12, fontWeight: light),
              ),
              Text(
                Utils.dateTimeFormat4(checkOut),
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 14, fontWeight: medium)
                    : blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              )
            ],
          ),
          const SizedBox(
            height: 14.0,
          ),
          // Guest
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'Guest',
          //       style: darkGreyTextStyle.copyWith(
          //         fontSize: 12,
          //         fontWeight: light,
          //       ),
          //     ),
          //     Text(
          //       guest.toString(),
          //       style:
          //           blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
          //     )
          //   ],
          // ),
          const SizedBox(
            height: 22.0,
          ),
          MySeparator(
            height: 3,
            color: currentTheme ? white70Color.withOpacity(0.3) : whiteColor,
          ),
          const SizedBox(
            height: 30.0,
          ),
          // Taxes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Taxes 5%',
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 12, fontWeight: light)
                    : darkGreyTextStyle.copyWith(
                        fontSize: 12, fontWeight: light),
              ),
              Text(
                Utils.currencyFormat2(taxes),
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 14, fontWeight: medium)
                    : blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
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
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 12, fontWeight: light)
                    : darkGreyTextStyle.copyWith(
                        fontSize: 12, fontWeight: light),
              ),
              Text(
                Utils.currencyFormat2(night),
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 14, fontWeight: medium)
                    : blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
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
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 12, fontWeight: light)
                    : darkGreyTextStyle.copyWith(
                        fontSize: 12, fontWeight: light),
              ),
              Text(
                Utils.currencyFormat2(total),
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 14, fontWeight: medium)
                    : blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              )
            ],
          ),
        ],
      ),
    );
  }
}
