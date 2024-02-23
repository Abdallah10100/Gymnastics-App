import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:todo_app/screens/common_widgets/fitness_button.dart';

import '../../../core/const/color_constants.dart';
import '../../../core/const/path_constants.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../core/servicses/firbase_utils.dart';
import '../../../data/my_user_data.dart';
import '../../common_widgets/custom_text_form_fileld.dart';
import '../../common_widgets/dialog_utiils.dart';
import '../../home/page/picker_utils.dart';
import '../../login/page/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'Sign up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(183, 147, 254, 100),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "      Create an account!👋",
          style: TextStyle(
              color: ColorConstants.primaryColor,
              fontSize: 26,
              fontWeight: FontWeight.bold),
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
                ])),
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015),
                    Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 70,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : CircleAvatar(
                                radius: 70,
                                child: Image.asset(
                                  PathConstants.profile,
                                ),
                              ),
                        Positioned(
                          bottom: -10,
                          left: 88,
                          child: IconButton(
                            onPressed: selectImage,
                            icon: const Icon(
                              Icons.add_a_photo,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015),
                    CustomTextFormField(
                      label: 'User Name',
                      controller: nameController,
                      myValidator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Enter User Name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      label: 'Confirm Password',
                      controller: confirmPasswordController,
                      isPassword: true,
                      keyBoardType: TextInputType.number,
                      myValidator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Enter Confirmation Password";
                        }
                        if (text != passwordController.text) {
                          return "Password doesn't match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FitnessButton(title: "Sign up", onTap: register),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(LoginScreen.routeName);
                            },
                            child: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                  color: Theme.of(context).primaryColor),
                            ))
                      ],
                    )
                  ],
                ))),
      ),
    );
  }

  void register() async {
    if (formKey.currentState?.validate() == true)

      /// show loading
      DialogUtils.showLoading(context, 'Loading...');
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      MyUser myUser = MyUser(
        id: credential.user?.uid ?? '',
        name: nameController.text,
        email: emailController.text,
      );
      await FirebaseUtils.addUserToFireStore(myUser);
      var authProvider = Provider.of<UserAuthProvider>(context, listen: false);
      authProvider.updateUser(myUser);

      /// hide loading
      DialogUtils.hideLoading(context);

      /// show message
      DialogUtils.showMessage(context, 'Account Created Successfully!',
          quickAlertType: QuickAlertType.success,
          title: 'Success',
          posActionName: 'Okay', posAction: () {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      });
    } on FirebaseAuthException catch (e) {
      /// show message(error)
      String errorMessage = 'Sorry, something went wrong';
      if (e.code == 'weak-password') {
        /// hide loading
        DialogUtils.hideLoading(context);
        errorMessage = 'The password provided is too weak.';
        DialogUtils.showMessage(context, errorMessage,
            quickAlertType: QuickAlertType.error,
            title: 'Oops...',
            posActionName: 'Okay');
      } else if (e.code == 'email-already-in-use') {
        DialogUtils.hideLoading(context);
        errorMessage = 'The account already exists for that email.';
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
