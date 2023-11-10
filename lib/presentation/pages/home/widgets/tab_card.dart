import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabTitles;
  final List<Widget> tabViews;

  CustomTabBar({
    required this.tabController,
    required this.tabTitles,
    required this.tabViews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          labelColor: blackColor,
          labelStyle: blackTextStyle,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: primaryColor,
          isScrollable: true,
          tabs: tabTitles.map((title) => Tab(text: title)).toList(),
        ),
        Container(
          height: 300,
          child: TabBarView(
            controller: tabController,
            children: tabViews,
          ),
        ),
      ],
    );
  }
}
