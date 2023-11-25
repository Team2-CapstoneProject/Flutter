import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HelpPage extends StatelessWidget {
  static const String routeName = '/help';
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
      appBar: AppBar(
        title: Text(
          'Request Help',
          style: currentTheme
              ? whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold)
              : blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
        ),
        centerTitle: true,
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/help.json'),
              SizedBox(
                height: 30,
              ),
              Text(
                'How we can help you?',
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 24, fontWeight: bold)
                    : blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'It looks like you are experiencing problems with our app. We are here to help so pease get in touch with us',
                style: currentTheme
                    ? whiteTextStyle.copyWith(fontSize: 14, fontWeight: light)
                    : blackTextStyle.copyWith(fontSize: 14, fontWeight: light),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: white70Color.withOpacity(0.1),
                    ),
                    child: Column(
                      children: [
                        Lottie.asset('assets/lottie/chat.json'),
                        Text(
                          'Chat with us',
                          style: currentTheme
                              ? whiteTextStyle.copyWith(
                                  fontSize: 14, fontWeight: semiBold)
                              : blackTextStyle.copyWith(
                                  fontSize: 14, fontWeight: semiBold),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: white70Color.withOpacity(0.1),
                    ),
                    child: Column(
                      children: [
                        Lottie.asset('assets/lottie/mail.json'),
                        Text(
                          'Email us',
                          style: currentTheme
                              ? whiteTextStyle.copyWith(
                                  fontSize: 14, fontWeight: semiBold)
                              : blackTextStyle.copyWith(
                                  fontSize: 14, fontWeight: semiBold),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
