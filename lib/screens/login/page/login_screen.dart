import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:todo_app/screens/common_widgets/fitness_button.dart';
import 'package:todo_app/screens/forgot_password/page/forgot_password_screen.dart';
import 'package:todo_app/screens/sign_up/page/sign_up_screen.dart';

import '../../../core/const/color_constants.dart';
import '../../../core/const/text_constants.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../core/servicses/firbase_utils.dart';
import '../../common_widgets/custom_text_form_fileld.dart';
import '../../common_widgets/dialog_utiils.dart';
import '../../home/page/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Gymnastics App!",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: ColorConstants.primaryColor),
        ),
        backgroundColor: Color.fromRGBO(183, 147, 254, 100),
      ),
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
          child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Welcome Back!👋",
                        style: TextStyle(
                            color: ColorConstants.textBlack,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 18),
                    CustomTextFormField(
                      label: 'Password',
                      controller: passwordController,
                      isPassword: true,
                      keyBoardType: TextInputType.number,
                      myValidator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Enter Password";
                        }
                        if (text.length < 6) {
                          return "Password Should be at least 6 chars";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 18),
                    GestureDetector(
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          TextConstants.forgotPassword,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.primaryColor,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, ForgotPassword.routeName);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FitnessButton(title: "Login", onTap: login),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .21,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(SignUpScreen.routeName);
                            },
                            child: Text(
                              'Sign Up',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                  color: Theme.of(context).primaryColor),
                            ))
                      ],
                    )
                  ],
                ),
              ))),
    );
  }

  void login() async {
    if (formKey.currentState?.validate() == true)
      DialogUtils.showLoading(context, 'Loading...');
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      var user =
          await FirebaseUtils.readUserFromFireStore(credential.user?.uid ?? "");
      if (user == null) {
        /// user authenticated but not found in database
        return;
      }
      var authProvider = Provider.of<UserAuthProvider>(context, listen: false);
      authProvider.updateUser(user);
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(context, 'Login Successfully!',
          quickAlertType: QuickAlertType.success,
          title: 'Success',
          posActionName: 'Okay', posAction: () {
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      });
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Sorry, something went wrong';
      if (e.code == 'user-not-found') {
        DialogUtils.hideLoading(context);
        errorMessage = 'No user found for that email.';
        DialogUtils.showMessage(context, errorMessage,
            quickAlertType: QuickAlertType.error,
            title: 'Oops...',
            posActionName: 'Okay');
      } else if (e.code == 'wrong-password') {
        DialogUtils.hideLoading(context);
        errorMessage = 'Wrong password provided for that user.';
        DialogUtils.showMessage(context, errorMessage,
            quickAlertType: QuickAlertType.error,
            title: 'Oops...',
            posActionName: 'Okay');
      }
    } catch (e) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(context, e.toString(),
          quickAlertType: QuickAlertType.error,
          title: 'Oops...',
          posActionName: 'Okay');
    }
  }
}
