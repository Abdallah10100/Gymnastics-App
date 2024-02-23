import 'package:flutter/material.dart';
import 'package:todo_app/screens/common_widgets/fitness_button.dart';

import '../../../core/const/color_constants.dart';
import 'change_password.dart';

class EditAccount extends StatefulWidget {
  static const String routeName = "edit_account";

  EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

TextEditingController fullNameConroller = TextEditingController();
TextEditingController emailConroller = TextEditingController();
var formKey = GlobalKey<FormState>(); //validate

class _EditAccountState extends State<EditAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit account",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0xff000000),
          ),
        ),
        backgroundColor: Color.fromRGBO(183, 147, 254, 100),
      ),
      body: SingleChildScrollView(
        child: Container(
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
              Text(
                "Edit Photo",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: ColorConstants.white,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(13),
                child: Row(
                  children: [
                    Text(
                      "Full name",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  autofocus: false,
                  controller: fullNameConroller,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty)
                      return "you must eneter your full name";
                    else {
                      return "null";
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    filled: true,
                    fillColor: ColorConstants.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: 'enter your full name',
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
                padding: const EdgeInsets.all(13),
                child: Row(
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  autofocus: false,
                  controller: emailConroller,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty)
                      return "you must eneter your email address";
                    else {
                      return "null";
                    }
                    // var regex = RegExp(
                    //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    // if (!regex.hasMatch(value)) {
                    //   return "Invalid user name";
                    // }
                    // return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    filled: true,
                    fillColor: ColorConstants.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: 'enter your email ',
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
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ChangePassword.routeName);
                      },
                      child: Text(
                        "Change Password",
                        style: TextStyle(
                          color: Color(0xff6358E1),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, ChangePassword.routeName);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: FitnessButton(title: 'Save', onTap: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
