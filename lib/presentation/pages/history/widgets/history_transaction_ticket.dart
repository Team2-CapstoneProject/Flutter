import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/presentation/bloc/history/history_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/history/widgets/history_ticket.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_card_vila.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_circular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryTransactionTicket extends StatefulWidget {
  static const String routeName = '/historydetail';
  final int id;
  const HistoryTransactionTicket({super.key, required this.id});

  @override
  State<HistoryTransactionTicket> createState() =>
      _HistoryTransactionTicketState();
}

class _HistoryTransactionTicketState extends State<HistoryTransactionTicket> {
  @override
  void initState() {
    context.read<HistoryBloc>().add(GetSpecificEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(color: darkGrey),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) {
              if (state is HistorySpecificLoaded) {
                final data = state.historyTransactionResponseModel;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 5),
                      child: Text(
                        'Ticket',
                        style: blackTextStyle.copyWith(
                          fontSize: 32,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),

                    // Villa
                    CustomCardVila(
                      image: data.vilaImage,
                      name: data.vilaName,
                      location: data.vilaLocation,
                      price: data.vilaPrice,
                    ),

                    // Ticket
                    HistoryTicket(
                      taxes: data.taxes,
                      night: data.vilaPrice,
                      total: data.totalPrice,
                      name: data.fullName,
                      checkIn: data.tglCheckin,
                      checkOut: data.tglCheckout,
                      guest: data.nGuest,
                    )
                  ],
                );
              } else if (state is HistoryLoading) {
                return CustomCircular();
              }
              return SizedBox();
            },
          )
        ],
      ),
    );
  }
}
