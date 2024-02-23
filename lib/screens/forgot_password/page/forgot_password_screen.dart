import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:todo_app/screens/common_widgets/fitness_button.dart';
import 'package:todo_app/screens/login/page/login_screen.dart';

import '../../../core/const/color_constants.dart';
import '../../../core/const/text_constants.dart';
import '../../common_widgets/custom_text_form_fileld.dart';
import '../../common_widgets/dialog_utiils.dart';

class ForgotPassword extends StatefulWidget {
  static const String routeName = 'Forgot-password';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: Text(TextConstants.passwordReset,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Color.fromRGBO(183, 147, 254, 100),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          iconTheme: IconThemeData(
            color: ColorConstants.primaryColor,
          )),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topRight,
                colors: [
              ColorConstants.white,
              ColorConstants.disabledColor,
              Color.fromRGBO(183, 147, 254, 100),
            ])),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    " Enter your email and we will send \n "
                    "      you a password reset link!",
                    style: TextStyle(
                        color: ColorConstants.textBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              CustomTextFormField(
                label: 'Email Address',
                controller: emailController,
                myValidator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return "Please Enter Email Address";
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(text);
                  if (!emailValid) {
                    return "Please Enter Valid Email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: FitnessButton(title: "Send", onTap: resetPassword),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future resetPassword() async {
    DialogUtils.showLoading(context, 'Loading...');
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      DialogUtils.showMessage(context, '',
          quickAlertType: QuickAlertType.info,
          title: 'Check Your Email!',
          posActionName: 'Okay', posAction: () {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      });
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(context, e.toString(),
          quickAlertType: QuickAlertType.error,
          title: 'Oops...',
          posActionName: 'Okay');
    }
  }
}
