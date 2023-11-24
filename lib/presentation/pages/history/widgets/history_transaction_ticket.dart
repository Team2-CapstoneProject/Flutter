import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/models/request/history_request_model.dart';
import 'package:capstone_project_villa/data/models/response/history_response_model.dart';
import 'package:capstone_project_villa/presentation/bloc/history/history_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/history/widgets/history_ticket.dart';
import 'package:capstone_project_villa/presentation/pages/navbar/bottom_navbar.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_card_vila.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_circular.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryTransactionTicket extends StatefulWidget {
  // static const String routeName = '/historydetail';
  final int id;
  final AllTransaction data;
  const HistoryTransactionTicket(
      {super.key, required this.id, required this.data});

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
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: currentTheme == ThemeData.light()
              ? whiteColor
              : Color(0xff1E1E1E),
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor:
            currentTheme == ThemeData.light() ? whiteColor : Color(0xff1E1E1E),
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
                        style: currentTheme
                            ? whiteTextStyle.copyWith(
                                fontSize: 32, fontWeight: semiBold)
                            : blackTextStyle.copyWith(
                                fontSize: 32, fontWeight: semiBold),
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
                    ),
                  ],
                );
              } else if (state is HistoryLoading) {
                return CustomCircular();
              }
              return SizedBox();
            },
          ),
          BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) {
              if (state is HistorySpecificLoaded) {
                final transactionStatus =
                    state.historyTransactionResponseModel.transactionStatus;

                if (transactionStatus == 1) {
                  return Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocConsumer<HistoryBloc, HistoryState>(
                          listener: (context, state) {
                            Navigator.pushReplacementNamed(
                              context,
                              BottomNavbarPage.routeName,
                            );
                          },
                          builder: (context, state) {
                            return Container(
                              height: 40,
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: redColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  final cancelRequest = HistoryRequestModel(
                                    transactionType: 'cancel',
                                  );
                                  print(
                                      'Cancel request: ${cancelRequest.toJson()}');
                                  context.read<HistoryBloc>().add(
                                        HistoryPaymentEvent(
                                          historyRequestModel: cancelRequest,
                                          id: widget.data.id,
                                        ),
                                      );
                                },
                                child: Text('Cancel'),
                              ),
                            );
                          },
                        ),
                        BlocConsumer<HistoryBloc, HistoryState>(
                          listener: (context, state) {
                            if (state is HistoryPaymentSuccess) {}
                          },
                          builder: (context, state) {
                            return Container(
                              height: 40,
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  final payRequest = HistoryRequestModel(
                                    transactionType: 'pay',
                                  );
                                  print('Pay request: ${payRequest.toJson()}');
                                  context.read<HistoryBloc>().add(
                                        HistoryPaymentEvent(
                                          historyRequestModel: payRequest,
                                          id: widget.data.id,
                                        ),
                                      );
                                },
                                child: Text('Pay'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                } else if (transactionStatus == 2) {
                  return Container(
                    height: 55,
                    margin: EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: whiteColor,
                        side: BorderSide(color: grey95),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Leave a review',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  );
                } else {
                  return SizedBox();
                }
              }
              return SizedBox();
            },
          )
        ],
      ),
    );
  }
}
