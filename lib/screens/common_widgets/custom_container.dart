import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  double width;
  double height;
  Widget widget;

  CustomContainer({
    super.key,
    required this.width,
    required this.height,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: widget,
    );
  }
}
