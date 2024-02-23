import 'dart:async';

import 'package:flutter/material.dart';

import '../onboarding/onboarding.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(Onboarding.routeName);
    });
    return Scaffold(
      body: Image.asset(
        'assets/images/onboarding/splash.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
