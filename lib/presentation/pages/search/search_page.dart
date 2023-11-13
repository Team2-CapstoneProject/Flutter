import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:capstone_project_villa/data/models/request/search_request_model.dart';
import 'package:capstone_project_villa/presentation/bloc/search/search_bloc.dart';

import '../../../common/constants.dart';
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: whiteColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(color: darkGrey),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    controller: _searchController,
                    onChanged: (value) {
                      // Live search as the user types
                      BlocProvider.of<SearchBloc>(context).add(
                        PerformSearch(
                          SearchRequestModel(searchText: value),
                        ),
                      );
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ),
                      hintText: 'Search',
                      labelStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return CircularProgressIndicator();
                    } else if (state is SearchSuccess) {
                      return state.searchResponse.allVilas.isEmpty
                          ? Text('No results found.')
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
                      return Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 30),
                            Text("Please wait a few seconds"),
                          ],
                        ),
                      );
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
