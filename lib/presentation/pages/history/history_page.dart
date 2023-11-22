import 'package:capstone_project_villa/presentation/bloc/history/history_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/history/widgets/history_card.dart';
import 'package:capstone_project_villa/presentation/pages/history/widgets/history_shimmer.dart';
import 'package:capstone_project_villa/presentation/pages/history/widgets/history_transaction_ticket.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HistoryPage extends StatefulWidget {
  static const String routeName = '/history';
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final vilaController = TextEditingController();
  late HistoryBloc historyBloc;

  @override
  void initState() {
    historyBloc = context.read<HistoryBloc>();
    if (vilaController.text.isEmpty) {
      historyBloc.add(GetHistoryEvent());
    } else {
      historyBloc.add(GetHistoryByNameEvent(name: vilaController.text));
    }
    super.initState();
  }

  @override
  void dispose() {
    vilaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Column(
              children: [
                // Search Button
                CustomSearch(
                  controller: vilaController,
                  onChanged: (value) {
                    setState(() {
                      if (value.isEmpty) {
                        historyBloc.add(GetHistoryEvent());
                      } else {
                        historyBloc.add(
                            GetHistoryByNameEvent(name: vilaController.text));
                      }
                    });
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      if (value.isNotEmpty) {
                        context.read<HistoryBloc>().add(
                            GetHistoryByNameEvent(name: vilaController.text));
                      } else {
                        vilaController.clear();
                        context.read<HistoryBloc>().add(GetHistoryEvent());
                      }
                    });
                  },
                ),
                vilaController.text.isEmpty
                    ? buildRecentVila()
                    : buildResult(vilaController.text)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildResult(String searchTerm) {
  return BlocBuilder<HistoryBloc, HistoryState>(
    builder: (context, state) {
      if (state is HistorySearchLoaded) {
        final historyByName = state.historyResponseModel.allTransactions;

        if (searchTerm.isNotEmpty) {
          final filteredList = historyByName
              .where((transaction) => transaction.vilas.name
                  .toLowerCase()
                  .contains(searchTerm.toLowerCase()))
              .toList();

          if (filteredList.isEmpty) {
            return Center(
              child: Text('No result found for "$searchTerm"'),
            );
          }

          return ListView.builder(
            itemCount: filteredList.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final history = filteredList[index].vilas;
              return HistoryCard(
                image: history.vilaImages[0].sliderImage,
                name: history.name,
                location: history.location,
                price: history.price,
                status: historyByName[index].transactionStatuses[0].statusId,
                onViewPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HistoryTransactionTicket(
                                id: historyByName[index].id,
                                data: historyByName[index],
                              )));
                },
              );
            },
          );
        }
      } else if (state is HistoryLoading) {
        return HistoryShimmer();
      }
      return SizedBox();
    },
  );
}

Widget buildRecentVila() {
  return BlocBuilder<HistoryBloc, HistoryState>(
    builder: (context, state) {
      if (state is HistoryLoaded) {
        final allHistory = state.historyResponseModel.allTransactions;

        if (allHistory.isEmpty) {
          return Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
              ),
              child: Lottie.asset('assets/lottie/nodata.json'));
        }

        return ListView.builder(
          itemCount: state.historyResponseModel.allTransactions.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final history = allHistory[index].vilas;
            return HistoryCard(
              image: history.vilaImages[0].sliderImage,
              name: history.name,
              location: history.location,
              price: history.price,
              status: allHistory[index].transactionStatuses[0].statusId,
              onViewPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HistoryTransactionTicket(
                              id: allHistory[index].id,
                              data: allHistory[index],
                            )));
              },
            );
          },
        );
      } else if (state is HistoryLoading) {
        return HistoryShimmer();
      }
      return SizedBox();
    },
  );
}
