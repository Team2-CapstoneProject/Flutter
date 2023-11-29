import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/common/utils.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_separator.dart';
import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class CustomTicket extends StatelessWidget {
  final DateTime checkin;
  final DateTime checkout;
  final int taxes;
  final int night;
  final int total;
  const CustomTicket(
      {super.key,
      required this.taxes,
      required this.night,
      required this.total,
      required this.checkin,
      required this.checkout});

  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    return TicketWidget(
      color: currentTheme ? white70Color.withOpacity(0.3) : grey95,
      padding: EdgeInsets.all(25),
      isCornerRounded: true,
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Check In',
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 12, fontWeight: light)
                    : darkGreyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
              ),
              Text(Utils.dateTimeFormat4(checkin))
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Check Out',
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 12, fontWeight: light)
                    : darkGreyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
              ),
              Text(Utils.dateTimeFormat4(checkout)),
            ],
          ),
          const SizedBox(
            height: 65.0,
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
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 12, fontWeight: light)
                    : darkGreyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
              ),
              Text(Utils.currencyFormat2(taxes))
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
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 12, fontWeight: light)
                    : darkGreyTextStyle.copyWith(
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
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 12, fontWeight: light)
                    : darkGreyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
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
