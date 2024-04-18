class OnboardingInfo {
  final String title;
  final String description;
  final String image;
  OnboardingInfo(
      {required this.title, required this.description, required this.image});
}

class OnboardingItems {
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: 'Nearby restaurants',
        description:
            "You don't have to go far to find a good restaurant we have provided all the restaurants that is near you",
        image: 'assets/images/blog_onboarding.jpg'),
    OnboardingInfo(
        title: 'Select the Favorites Menu',
        description:
            "Now eat well, don't leave the house,You can choose your favorite food only with one click",
        image: 'assets/images/onboarding_1.png'),
    OnboardingInfo(
        title: 'Real Time Booking System',
        description:
            'You can eat at expensive restaurants with affordable price',
        image: 'assets/images/onboarding_3.png'),
  ];
}
