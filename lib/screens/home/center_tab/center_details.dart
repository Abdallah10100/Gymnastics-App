import 'package:flutter/material.dart';

import '../../../core/const/color_constants.dart';
import '../../common_widgets/custom_container.dart';
import 'artistic_page.dart';
import 'instructors_content.dart';

class CentersDetail extends StatefulWidget {
  static String routeName = "CentersDetail";

  @override
  State<CentersDetail> createState() => _CentersDetailState();
}

class _CentersDetailState extends State<CentersDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(183, 147, 254, 100),
        title: const Text("GT ACADEMY"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context, Instructors.routeName);
          },
        ),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/Image1.png",
                fit: BoxFit.cover,
              ),
              CustomContainer(
                width: 350,
                height: 540,
                widget: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 15),
                          const Text("GT ACADEMY",
                              style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff000000))),
                          SizedBox(width: 180),
                          GestureDetector(
                              onTap: () {
                                showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2025, 1, 1, 1));
                              },
                              child: const Icon(Icons.table_view)),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text(
                            "location",
                            style: TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              SizedBox(width: 150),
                              Text("Schedule",
                                  style: TextStyle(
                                      fontSize: 15,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff000000))),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        margin: const EdgeInsets.all(15),
                        width: 327,
                        height: 111,
                        decoration: BoxDecoration(
                            color: const Color(0xff6358E1),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/Rectangle 66.png",
                              width: 85,
                              height: 70,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Artistic gymnastics.",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Artistic.routeName);
                                },
                                child: const Icon(
                                  Icons.keyboard_arrow_right_sharp,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        margin: const EdgeInsets.all(15),
                        width: 327,
                        height: 111,
                        decoration: BoxDecoration(
                            color: const Color(0xff6358E1),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/Rectangle 9.png",
                              width: 85,
                              height: 70,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Rhythmic gymnastics.",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Artistic.routeName);
                                },
                                child: const Icon(
                                  Icons.keyboard_arrow_right_sharp,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        margin: const EdgeInsets.all(15),
                        width: 327,
                        height: 111,
                        decoration: BoxDecoration(
                            color: const Color(0xff6358E1),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/Rectangle 7.png",
                              width: 85,
                              height: 70,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Rhythmic gymnastics.",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Artistic.routeName);
                                },
                                child: const Icon(
                                  Icons.keyboard_arrow_right_sharp,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
