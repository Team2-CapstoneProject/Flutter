import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/models/request/history_request_model.dart';
import 'package:capstone_project_villa/presentation/bloc/history/history_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/history/widgets/history_review.dart';
import 'package:capstone_project_villa/presentation/pages/history/widgets/history_ticket.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_card_vila.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_circular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryTransactionTicket extends StatefulWidget {
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
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        backgroundColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 24,
              color: currentTheme ? whiteColor : greyColor,
            ),
          ),
          backgroundColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
          elevation: 0,
        ),
        body: BlocListener<HistoryBloc, HistoryState>(
          listener: (context, state) {
            if (state is HistoryPaymentSuccess) {
              setState(() {
                context
                    .read<HistoryBloc>()
                    .add(GetSpecificEvent(id: widget.id));
              });
            }
          },
          child: ListView(
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
                          // guest: data.nGuest,
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
                    final user = state.historyTransactionResponseModel.id;
                    final transactionStatus =
                        state.historyTransactionResponseModel.transactionStatus;

                    if (transactionStatus == 1) {
                      return Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocConsumer<HistoryBloc, HistoryState>(
                              listener: (context, state) {},
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
                                              historyRequestModel:
                                                  cancelRequest,
                                              id: user,
                                            ),
                                          );
                                    },
                                    child: Text('Cancel'),
                                  ),
                                );
                              },
                            ),
                            BlocConsumer<HistoryBloc, HistoryState>(
                              listener: (context, state) {},
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
                                      print(
                                          'Pay request: ${payRequest.toJson()}');
                                      context.read<HistoryBloc>().add(
                                            HistoryPaymentEvent(
                                              historyRequestModel: payRequest,
                                              id: user,
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
                      final checkReview =
                          state.historyTransactionResponseModel.reviewScore;

                      if (checkReview == 0) {
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
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: currentTheme
                                    ? Color(0xff1E1E1E)
                                    : whiteColor,
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return SingleChildScrollView(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom,
                                      ),
                                      child: ReviewFormWidget(
                                        reviewId: state
                                            .historyTransactionResponseModel,
                                      ),
                                    ),
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                              );
                            },
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
                    } else if (transactionStatus == 3) {
                      return SizedBox();
                    }
                  }
                  return SizedBox();
                },
              )
            ],
          ),
        ));
  }
}
