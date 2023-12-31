import 'package:capstone_project_villa/presentation/pages/search/widget/shimmer_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:capstone_project_villa/data/models/request/search_request_model.dart';
import 'package:capstone_project_villa/presentation/bloc/search/search_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../common/constants.dart';
import '../../widgets/custom_search.dart';
import 'widget/horizontal_card.dart';
import '../detail/detail_page.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = '/search';

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: whiteColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
          statusBarIconBrightness:
              currentTheme ? Brightness.light : Brightness.dark,
        ),
        iconTheme: IconThemeData(color: darkGrey),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomSearch(
                  onChanged: (value) {
                    BlocProvider.of<SearchBloc>(context).add(
                      PerformSearch(
                        SearchRequestModel(searchText: value),
                      ),
                    );
                  },
                  controller: _searchController,
                ),
                BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (_searchController.text.isEmpty) {
                      return Column(
                        children: [
                          Lottie.asset('assets/lottie/search.json'),
                          Text(
                            'Please do a search',
                            style: currentTheme
                                ? whiteTextStyle.copyWith(fontSize: 14)
                                : primaryTextStyle.copyWith(fontSize: 14),
                          ).tr(),
                        ],
                      );
                    } else if (state is SearchLoading) {
                      return ShimmerSearch();
                    } else if (state is SearchSuccess) {
                      return state.searchResponse.allVilas.isEmpty
                          ? Text('no_results_found'.tr())
                          : Column(
                              children: state.searchResponse.allVilas
                                  .map(
                                    (vila) => GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPage(id: vila.id),
                                          ),
                                        );
                                      },
                                      child: HorizontalCard(
                                        vila: vila,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                    } else if (state is SearchError) {
                      return ShimmerSearch();
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
