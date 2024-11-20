class OnboardingContent {
  String image;
  String title;
  String description;
  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      description: "Pick your food from our menu\n  and add them to cart",
      image: 'images/screen1.png',
      title: 'Select from Our\n     Best Menu'),
  OnboardingContent(
      description:
          'You can pay Cash on Delivery and/or \n Effortless UPI Payments',
      image: 'images/screen2.png',
      title: 'Easy and Safe Online Payments'),
  OnboardingContent(
      description:
          'We deliver your food in less than 30 minutes\n  with our FASTEST delivery system\n To Your Doorsteps',
      image: 'images/screen3.png',
      title: 'Fastest Delivery'),
];
