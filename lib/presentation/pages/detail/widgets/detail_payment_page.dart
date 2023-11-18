import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/models/response/transaction_response_model.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_card_vila.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_ticket.dart';
import 'package:flutter/material.dart';

class DetailPaymentPage extends StatefulWidget {
  final TransactionResponseModel data;
  const DetailPaymentPage({super.key, required this.data});

  @override
  State<DetailPaymentPage> createState() => _DetailPaymentPageState();
}

class _DetailPaymentPageState extends State<DetailPaymentPage> {
  @override
  Widget build(BuildContext context) {
    final vila = widget.data.vila;
    final payment = widget.data;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: darkGrey),
        backgroundColor: whiteColor,
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
                  style: blackTextStyle.copyWith(
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
              )
            ],
          )
        ],
      ),
    );
  }
}
