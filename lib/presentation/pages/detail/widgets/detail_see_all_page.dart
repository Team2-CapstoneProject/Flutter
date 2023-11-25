import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/constants.dart';

class DetailSeeAllPage extends StatelessWidget {
  final List<String> galleryPhotos;

  DetailSeeAllPage({required this.galleryPhotos});

  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
          statusBarIconBrightness:
              currentTheme ? Brightness.light : Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: currentTheme ? whiteColor : darkGrey,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: galleryPhotos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _showImageSliderDialog(context, index);
              },
              child: GridTile(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    galleryPhotos[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showImageSliderDialog(BuildContext context, int initialIndex) {
    // ignore: unused_local_variable
    int _currentImageIndex = initialIndex;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double carouselHeight = (constraints.maxWidth * 4 / 3);
              return SizedBox(
                width: double.infinity,
                height: carouselHeight,
                child: CarouselSlider.builder(
                  itemCount: galleryPhotos.length,
                  options: CarouselOptions(
                    initialPage: initialIndex,
                    aspectRatio: 3 / 4,
                    enableInfiniteScroll: true,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    onPageChanged: (index, _) {
                      _currentImageIndex = index;
                    },
                  ),
                  itemBuilder: (context, index, _) {
                    return Image.network(
                      galleryPhotos[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
