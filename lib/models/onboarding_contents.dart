class OnboardingContents {
  final String image;
  final String desc;

  OnboardingContents({
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    image: "assets/images/onboarding1.png",
    desc: "Effortlessly indentify Indian delight with a single click!",
  ),
  OnboardingContents(
    image: "assets/images/onboarding2.png",
    desc:
        "Unlock Nutritional Insights at your Finger Tips",
  ),
  OnboardingContents(
    image: "assets/images/onboarding3.png",
    desc:
        "Elevate Health by Tracking your Nutritional Intake",
  ),
];