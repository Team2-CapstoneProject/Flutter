import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/common/utils.dart';
import 'package:capstone_project_villa/presentation/bloc/history/history_bloc.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_search.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class HistoryPage extends StatefulWidget {
  static const String routeName = '/history';
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final vilaController = TextEditingController();

  @override
  void initState() {
    context.read<HistoryBloc>().add(GetHistoryEvent());
    context
        .read<HistoryBloc>()
        .add(GetHistoryByNameEvent(name: vilaController.text));
    super.initState();
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
                      if (value.isNotEmpty) {
                        context.read<HistoryBloc>().add(
                            GetHistoryByNameEvent(name: vilaController.text));
                      } else {
                        vilaController.clear();
                        context.read<HistoryBloc>().add(GetHistoryEvent());
                      }
                    });
                  },
                  // onFieldSubmitted: (value) {
                  //   setState(() {
                  //     if (value.isNotEmpty) {
                  //       context.read<HistoryBloc>().add(
                  //           GetHistoryByNameEvent(name: vilaController.text));
                  //     } else {
                  //       vilaController.clear();
                  //       context.read<HistoryBloc>().add(GetHistoryEvent());
                  //     }
                  //   });
                  // },
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
              final history = filteredList[index];
              return Container(
                height: 205,
                margin: EdgeInsets.only(bottom: 30),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: grey95,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 18,
                    left: 18,
                    right: 18,
                    bottom: 12,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 107,
                            width: 105,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: history.vilas.vilaImages.isNotEmpty &&
                                        history.vilas.vilaImages.isNotEmpty &&
                                        history.vilas.vilaImages[0].sliderImage
                                            .isNotEmpty
                                    ? NetworkImage(
                                        history.vilas.vilaImages[0].sliderImage,
                                      )
                                    : NetworkImage(
                                        'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          history.vilas.name,
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
                                              history.vilas.location,
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
                                        margin:
                                            EdgeInsets.symmetric(vertical: 8),
                                        child: Text.rich(
                                          TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: Utils.currencyFormat(
                                                  history.vilas.price,
                                                ),
                                                style:
                                                    darkGreyTextStyle.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: medium,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' /night',
                                                style:
                                                    darkGreyTextStyle.copyWith(
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
                      Container(
                        margin: EdgeInsetsDirectional.only(
                          top: 6,
                          bottom: 14,
                        ),
                        child: MySeparator(
                          height: 1,
                          color: whiteColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 34,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: whiteColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Cancel Booking',
                                style: darkGreyTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: medium,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 34,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'View',
                                style: whiteTextStyle.copyWith(
                                    fontSize: 12, fontWeight: medium),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
      } else if (state is HistoryLoading) {
        return ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 30),
              height: 205,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: white70Color,
              ),
            );
          },
        );
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
        return ListView.builder(
          itemCount: state.historyResponseModel.allTransactions.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final history = allHistory[index];
            return Container(
              height: 205,
              margin: EdgeInsets.only(bottom: 30),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: grey95,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 18,
                  left: 18,
                  right: 18,
                  bottom: 12,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 107,
                          width: 105,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: history.vilas.vilaImages.isNotEmpty &&
                                      history.vilas.vilaImages.isNotEmpty &&
                                      history.vilas.vilaImages[0].sliderImage
                                          .isNotEmpty
                                  ? NetworkImage(
                                      history.vilas.vilaImages[0].sliderImage,
                                    )
                                  : NetworkImage(
                                      'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
                                        history.vilas.name,
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
                                            history.vilas.location,
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
                                                history.vilas.price,
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
                    Container(
                      margin: EdgeInsetsDirectional.only(
                        top: 6,
                        bottom: 14,
                      ),
                      child: MySeparator(
                        height: 1,
                        color: whiteColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 34,
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Cancel Booking',
                              style: darkGreyTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: medium,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 34,
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'View',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 12, fontWeight: medium),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      } else if (state is HistoryLoading) {
        return ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 30),
              height: 205,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: white70Color,
              ),
            );
          },
        );
      }
      return SizedBox();
    },
  );
}
