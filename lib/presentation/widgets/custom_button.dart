import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                style: whiteTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                  letterSpacing: 0.5,
                ),
              ),
      ),
    );
  }
}
