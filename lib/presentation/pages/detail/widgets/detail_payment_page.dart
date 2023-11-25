import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/models/response/transaction_response_model.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_card_vila.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailPaymentPage extends StatefulWidget {
  final TransactionResponseModel data;
  const DetailPaymentPage({super.key, required this.data});

  @override
  State<DetailPaymentPage> createState() => _DetailPaymentPageState();
}

class _DetailPaymentPageState extends State<DetailPaymentPage> {
  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    final vila = widget.data.vila;
    final payment = widget.data;
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                  'Payment',
                  style: currentTheme
                      ? whiteTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold)
                      : blackTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                ),
              ),

              // Villa
              CustomCardVila(
                image: vila.vilaImages[0].sliderImage,
                name: vila.name,
                location: vila.location,
                price: vila.price,
              ),

              // Ticket
              CustomTicket(
                taxes: payment.taxes,
                night: payment.night,
                total: payment.total,
                checkin: payment.tglCheckin,
                checkout: payment.tglCheckout,
              )
            ],
          )
        ],
      ),
    );
  }
}
