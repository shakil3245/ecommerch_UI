import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/utils/appColor.dart';

class textFormFiled extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String?) validator;
  final TextInputType? textInputType;
  const textFormFiled(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.validator,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
        hintText: hintText,
      ),
    );
  }
}
