import 'package:capstone_project_villa/presentation/bloc/bookmark/bookmark_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/detail/detail_page.dart';

import '../search/widget/shimmer_search.dart';
import 'widget/horizontal_card.dart';
import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmarkPage extends StatefulWidget {
  static const String routeName = '/bookmark';
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  void initState() {
    context.read<BookmarkBloc>().add(GetBookmarkEvent());
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
        // actions: [
        //   Container(
        //     margin: const EdgeInsets.only(right: 30),
        //     child: GestureDetector(
        //       onTap: () {
        //         showDialog(
        //           barrierDismissible: false,
        //           context: context,
        //           builder: (context) => const CustomDialog(),
        //         );
        //       },
        //       child: Icon(
        //         Iconsax.notification,
        //         color: currentTheme ? white70Color : darkGrey,
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: SingleChildScrollView(
            child: BlocBuilder<BookmarkBloc, BookmarkState>(
              builder: (context, state) {
                // print('masuk awal' + state.toString());
                if (state is BookmarkLoading || state is BookmarkError) {
                  return ShimmerSearch();
                } else if (state is BookmarkSuccess) {
                  return state.bookmarkedVilas!.length == 0
                      ? Container()
                      : Column(
                          children: state.bookmarkedVilas!
                              .map(
                                (vila) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailPage(id: vila.vila_id),
                                      ),
                                    );
                                  },
                                  child: HorizontalCard(vila: vila),
                                ),
                              )
                              .toList(),
                        );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
