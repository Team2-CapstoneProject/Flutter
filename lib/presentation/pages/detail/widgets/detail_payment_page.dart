import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/common/utils.dart';
import 'package:capstone_project_villa/data/models/response/transaction_response_model.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_ticket.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
              Container(
                margin: EdgeInsets.only(bottom: 20),
                height: 145,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: grey95,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 19),
                      height: 107,
                      width: 105,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(
                            vila.vilaImages[0].sliderImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(19),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    vila.name,
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: medium,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Iconsax.location,
                                      size: 12,
                                      color: darkGrey,
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Flexible(
                                      child: Text(
                                        vila.location,
                                        style: blackTextStyle.copyWith(
                                          fontSize: 10,
                                          fontWeight: light,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  child: Text.rich(
                                    TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: Utils.currencyFormat(
                                            vila.price,
                                          ),
                                          style: darkGreyTextStyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: medium,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' /night',
                                          style: darkGreyTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: light,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              CustomTicket(
                taxes: payment.taxes.toString(),
                night: payment.night.toString(),
                total: payment.total.toString(),
              )
            ],
          )
        ],
      ),
    );
  }
}
