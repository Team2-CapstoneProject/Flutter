import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  get currentTheme => null;

  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: currentTheme ? white70Color.withOpacity(0.5) : grey95,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              size: 24,
              color: currentTheme ? whiteColor : darkGrey,
            ),
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: currentTheme == ThemeData.light()
                ? blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  )
                : whiteTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
          ),
        ],
      ),
    );
  }
}
