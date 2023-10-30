import 'package:capstone_project_villa/presentation/pages/authentication/login_page.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_button.dart';
import 'package:capstone_project_villa/styles/style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    "Discover Your Dream Getaway",
    "Unlock the Beauty of Villa Living",
    "Create Memories\n in Style",
  ];

  List<String> subTitles = [
    "Welcome to Azura Voyage, where your dream villa vacation begins, Explore out handpicked villas and experience the pinnacle of luxury.",
    "Find your perfect villa, book with ease,\n and unlock your ideal getaway.\n",
    "Your personal villa concierge awaits. Start your journey now. Your villa, your rules discover a world of possiblities.",
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              CarouselSlider(
                items: [
                  Image.asset(
                    'assets/onboarding/on1.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  Image.asset(
                    'assets/onboarding/on2.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  Image.asset(
                    'assets/onboarding/on3.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                ],
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.5,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                carouselController: carouselController,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: whiteColor,
              height: MediaQuery.of(context).size.height * 0.49,
              child: Column(
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: currentIndex == 0 ? 30 : 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(
                          color:
                              currentIndex == 0 ? primaryColor : white70Color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        width: currentIndex == 1 ? 30 : 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(
                          color:
                              currentIndex == 1 ? primaryColor : white70Color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        width: currentIndex == 2 ? 30 : 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(
                          color:
                              currentIndex == 2 ? primaryColor : white70Color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 88),
                        child: Text(
                          titles[currentIndex],
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 35),
                        child: Text(
                          subTitles[currentIndex],
                          style: greyTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 52),
                        child: CustomButton(
                          onPressed: () {
                            currentIndex == 2
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  )
                                : carouselController.nextPage();
                          },
                          text: 'Next',
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      currentIndex == 2
                          ? const SizedBox()
                          : TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Skip",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semiBold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
