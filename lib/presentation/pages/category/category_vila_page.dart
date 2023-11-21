import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/presentation/bloc/home/home_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/detail/detail_page.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_card_vila.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryVilaPage extends StatefulWidget {
  static const String routeName = '/categoryvila';
  const CategoryVilaPage({super.key});

  @override
  State<CategoryVilaPage> createState() => _CategoryVilaPageState();
}

class _CategoryVilaPageState extends State<CategoryVilaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        iconTheme: IconThemeData(color: darkGrey),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoaded) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.user.allVilas.length,
                      itemBuilder: (context, index) {
                        final vila = state.user.allVilas[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(id: vila.id),
                              ),
                            );
                          },
                          child: CustomCardVila(
                            image: vila.vilaImages.sliderImage,
                            name: vila.name,
                            location: vila.location,
                            price: vila.price,
                          ),
                        );
                      },
                    );
                  }
                  return SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
