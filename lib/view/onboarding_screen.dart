import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/view/world_states.dart';

import '../widgets/onboarding_card.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  static final PageController _pageController = PageController(initialPage: 0);
  late List<Widget> _onBoardingPages;

  @override
  void initState() {
    super.initState();
    _onBoardingPages = [
      OnBoardingCard(
        image: "assets/images/covid_onboarding1.png",
        title: 'Wear Mask',
        description:
        "Protect yourself and others by wearing a mask.It's a simple step to prevent the spread of COVID-19.",
        buttonText: 'Next',
        onPressed: () {
          _pageController.animateToPage(
            1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
      ),
      OnBoardingCard(
        image: "assets/images/covid_onboarding2.png",
        title: 'Use Sanitizer',
        description:
        "Keep your hands germ-free with regular use of sanitizer.Fight viruses and bacteria with just a quick squirt.",
        buttonText: 'Next',
        onPressed: () {
          _pageController.animateToPage(
            2,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
      ),
      OnBoardingCard(
        image: "assets/images/covid_onboarding3.png",
        title: 'Wash Hands',
        description:
        "Wash your hands thoroughly for at least 20 seconds.Clean hands save lives by stopping the virus in its tracks.",
        buttonText: 'Get Started',
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const WorldStatesScreen(),
            ),
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: orientation == Orientation.portrait ? 50.0 : 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: _onBoardingPages,
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: _onBoardingPages.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Color(0xFF424242),
                dotColor: Colors.white,
              ),
              onDotClicked: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
