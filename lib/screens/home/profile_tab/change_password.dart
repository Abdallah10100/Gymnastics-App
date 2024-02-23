import 'package:flutter/material.dart';

import '../../../core/const/color_constants.dart';
import '../../common_widgets/fitness_button.dart';

class ChangePassword extends StatefulWidget {
  static const String routeName = "change_password";

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

TextEditingController passwordConroller = TextEditingController();
TextEditingController confirmpasswordConroller = TextEditingController();

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color.fromRGBO(183, 147, 254, 100),
      ),
      body: Container(
        decoration: BoxDecoration(
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
              CircleAvatar(
                radius: 60,
                child: Image.asset(
                  "assets/images/home/profile.png",
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "lian",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  autofocus: false,
                  controller: passwordConroller,
                  obscureText: true,
                  // obscureText: !isVisible,
                  // suffixIcon: GestureDetector(
                  //     onTap: () {
                  //       isVisible=!isVisible;
                  //       setState(() {});
                  //     },
                  //     child: isVisible == true
                  //         ? Icon(Icons.visibility_off_outlined, size: 25)
                  //         : Icon(Icons.visibility_outlined, size: 25)),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "you must enter your password ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    filled: true,
                    fillColor: ColorConstants.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorConstants.white),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: 'new password',
                    contentPadding: EdgeInsets.all(18),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 4.5,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  autofocus: false,
                  controller: confirmpasswordConroller,
                  //obscureText: !isVisible,
                  // suffixIcon: GestureDetector(
                  //     onTap: () {
                  //       isVisible=!isVisible;
                  //       setState(() {});
                  //     },
                  //     child: isVisible == true
                  //         ? Icon(Icons.visibility_off_outlined, size: 25)
                  //         : Icon(Icons.visibility_outlined, size: 25)),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "you must enter your confirm password ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    filled: true,
                    fillColor: ColorConstants.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorConstants.white,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: 'confirm password',
                    contentPadding: EdgeInsets.all(18),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 4.5,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: FitnessButton(title: "Save", onTap: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
