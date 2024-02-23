import 'package:flutter/material.dart';
import 'package:todo_app/core/const/color_constants.dart';

class CustomTextFormField extends StatelessWidget {
  String label;
  TextInputType keyBoardType;
  bool isPassword;
  TextEditingController controller;
  String? Function(String?) myValidator;

  CustomTextFormField(
      {required this.label,
      this.keyBoardType = TextInputType.text,
      this.isPassword = false,
      required this.controller,
      required this.myValidator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelStyle: const TextStyle(fontSize: 18),
          label: Text(label),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 4)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 4)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(color: ColorConstants.errorColor, width: 4)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(color: ColorConstants.primaryColor, width: 4)),
        ),
        keyboardType: keyBoardType,
        obscureText: isPassword,
        controller: controller,
        validator: myValidator,
      ),
    );
  }
}
