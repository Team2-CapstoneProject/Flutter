import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/common/utils.dart';
import 'package:capstone_project_villa/data/models/request/bookmark_request_model.dart';
import 'package:capstone_project_villa/data/models/response/bookmark_response_model.dart';
import 'package:capstone_project_villa/presentation/bloc/bookmark/bookmark_bloc.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HorizontalCard extends StatelessWidget {
  final BookmarkedVila vila;

  const HorizontalCard({
    Key? key,
    required this.vila,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
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
                  vila.vila_image,
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
                          vila.vila_name,
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
                              vila.vila_location,
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
                                  vila.vila_price,
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: BlocConsumer<BookmarkBloc, BookmarkState>(
                          listener: (context, state) {
                            // print('masuk 1: ' + state.toString());
                          },
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () {
                                // print('masuk2');
                                context.read<BookmarkBloc>().add(
                                      ChangeBookmarkEvent(
                                        BookmarkRequestModel(
                                          id: vila.vila_id,
                                        ),
                                      ),
                                    );
                              },
                              child: Icon(
                                Iconsax.archive_tick1,
                              ),
                            );
                          },
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
    );
  }
}
