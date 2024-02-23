import 'package:flutter/material.dart';

import '../../../core/const/color_constants.dart';

class Artistic extends StatelessWidget {
  static String routeName = "Artistic";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GT ACADEMY"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context, Artistic.routeName);
          },
        ),
        backgroundColor: Color.fromRGBO(183, 147, 254, 100),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topRight,
              colors: [
                ColorConstants.white,
                ColorConstants.disabledColor,
                Color.fromRGBO(183, 147, 254, 100),
              ],
            ),
          ),
          child: Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      "Artistic gymnastics",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 350,
                height: 50,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: const Color(0xffE7E7E7),
                    borderRadius: BorderRadius.circular(20)),
                child: const Column(children: [
                  Row(
                    children: [
                      Icon(Icons.search),
                      Text(
                        "search",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff989898)),
                      ),
                      Spacer(),
                      Icon(Icons.list),
                    ],
                  ),
                ]),
              ),
              Container(
                width: 327,
                height: 90,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: ColorConstants.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/Image11.png",
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Richard Will",
                          style: TextStyle(
                            fontSize: 17,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(
                          "5 years experience",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 327,
                height: 90,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: ColorConstants.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/Image22.png",
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Jennifer James",
                          style: TextStyle(
                            fontSize: 17,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(
                          "4 years experience",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 11,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 327,
                height: 90,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: ColorConstants.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/Image33.png",
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Brian Edward",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(
                          "6 years experience",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 11,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 327,
                height: 90,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: ColorConstants.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/Image44.png",
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Emily Kevin",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(
                          "2 years experience",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 327,
                height: 90,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: ColorConstants.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/Image55.png",
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Rebecca Smith",
                          style: TextStyle(
                            fontSize: 17,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(
                          "8 years experience",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 327,
                height: 90,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: ColorConstants.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/Image666.png",
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Ronald Jason",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(
                          "9 years experience",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
