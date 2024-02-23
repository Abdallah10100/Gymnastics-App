import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:todo_app/screens/login/page/login_screen.dart';

import '../../core/const/color_constants.dart';
import '../../core/const/path_constants.dart';
import '../../core/const/text_constants.dart';

class Onboarding extends StatelessWidget {
  static const String routeName = 'onBoarding';
  final List<Introduction> list = [
    Introduction(
      title: TextConstants.onboarding1Title,
      titleTextStyle:
          const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      subTitle: TextConstants.onboarding1Description,
      subTitleTextStyle:
          const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      imageUrl: PathConstants.onboarding1,
    ),
    Introduction(
      title: TextConstants.onboarding2Title,
      titleTextStyle:
          const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      subTitle: TextConstants.onboarding2Description,
      subTitleTextStyle:
          const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      imageUrl: PathConstants.onboarding2,
    ),
    Introduction(
      title: TextConstants.onboarding3Title,
      titleTextStyle:
          const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      subTitle: TextConstants.onboarding3Description,
      subTitleTextStyle:
          const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      imageUrl: PathConstants.onboarding3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      backgroudColor: ColorConstants.white,
      foregroundColor: ColorConstants.primaryColor,
      introductionList: list,
      onTapSkipButton: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          )),
      skipTextStyle: const TextStyle(
        color: Colors.blueGrey,
        fontSize: 16,
      ),
    );
  }
}
