import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../model/onboarding_model.dart';
import '../res/global_colors.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView> {
  bool isLastPage = false;
  final controller = OnboardingItems();
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(bottom: 250),
        child: SmoothPageIndicator(
          onDotClicked: (index) {
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 400), curve: Curves.easeIn);
          },
          controller: pageController,
          count: controller.items.length,
          effect: const WormEffect(
            dotWidth: 20,
            dotHeight: 10,
            activeDotColor: AppColors.green,
            dotColor: Color(0xffE6E6E6),
          ),
        ),
      ),
      body: Center(
        child: PageView.builder(
          onPageChanged: (index) {
            isLastPage = controller.items.length - 1 == index;
            setState(() {});
          },
          itemCount: controller.items.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(controller.items[index].image),
                const SizedBox(height: 15),
                Text(
                  controller.items[index].title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    controller.items[index].description,
                    style: const TextStyle(
                      color: Color(0xff4B5563),
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
