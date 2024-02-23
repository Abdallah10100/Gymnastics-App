import 'package:flutter/material.dart';

import '../../../core/const/color_constants.dart';
import 'change_password.dart';
import 'edit_account.dart';

class ProfileContent extends StatelessWidget {
  static const String routeName = "profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Icon(
            Icons.edit,
            size: 25,
            color: Color(0xff6358E1),
          ),
        ],
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
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset(
              "assets/images/home/profile.png",
              width: 120,
              height: 150,
            ),
            SizedBox(height: 10),
            Text(
              "lian",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            buildProfileOption(
              text: "Edit Account",
              onTap: () {
                Navigator.pushNamed(context, EditAccount.routeName);
              },
            ),
            buildProfileOption(
              text: "Change Password",
              onTap: () {
                Navigator.pushNamed(context, ChangePassword.routeName);
              },
            ),
            buildProfileOption(
              text: "Sign Out",
              onTap: () {
                // Implement sign out logic here
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileOption(
      {required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: 50,
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: ColorConstants.primaryColor,
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.circular(60),
        ),
      ),
    );
  }
}
