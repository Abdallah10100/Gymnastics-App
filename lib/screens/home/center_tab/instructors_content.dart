import 'package:flutter/material.dart';

import '../../../core/const/color_constants.dart';
import 'center_details.dart';

class Instructors extends StatefulWidget {
  static String routeName = "instructors";

  @override
  State<Instructors> createState() => _InstructorsState();
}

class _InstructorsState extends State<Instructors> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 30),
                  child: Text(
                    "Training Centers",
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontSize: 24,
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
                          decoration: TextDecoration.none,
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
                        "assets/images/Image.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "GT ACADEMY",
                        style: TextStyle(
                          fontSize: 17,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CentersDetail.routeName);
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 10,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CentersDetail.routeName);
                        },
                        child: const Text(
                          "location",
                          style: TextStyle(
                              fontSize: 13,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffCFC5FB)),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/Image2.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "ASPIRE GYMNASTICS",
                        style: TextStyle(
                          fontSize: 17,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CentersDetail.routeName);
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 10,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CentersDetail.routeName);
                        },
                        child: const Text(
                          "location",
                          style: TextStyle(
                              fontSize: 13,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffCFC5FB)),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/Image3.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "SHAMS GYMNASTICS",
                        style: TextStyle(
                          fontSize: 17,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CentersDetail.routeName);
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 10,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CentersDetail.routeName);
                        },
                        child: const Text(
                          "location",
                          style: TextStyle(
                              fontSize: 13,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffCFC5FB)),
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
                        "assets/images/Image4.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "GYMNASTEX",
                        style: TextStyle(
                          fontSize: 17,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CentersDetail.routeName);
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 10,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CentersDetail.routeName);
                        },
                        child: const Text(
                          "location",
                          style: TextStyle(
                              fontSize: 13,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffCFC5FB)),
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
                        "assets/images/Image5.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "ELITE ACADEMY",
                        style: TextStyle(
                          fontSize: 17,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CentersDetail.routeName);
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 10,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CentersDetail.routeName);
                        },
                        child: const Text(
                          "location",
                          style: TextStyle(
                              fontSize: 13,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffCFC5FB)),
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
                        "assets/images/Image6.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "STEP UP ACADEMY",
                        style: TextStyle(
                          fontSize: 17,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CentersDetail.routeName);
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 10,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CentersDetail.routeName);
                        },
                        child: const Text(
                          "location",
                          style: TextStyle(
                              fontSize: 13,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffCFC5FB)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
