// ignore_for_file: must_be_immutable, camel_case_types, body_might_complete_normally_nullable, prefer_const_constructors

import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  textfield({Key? key, this.onchanged,this.inputType, this.hinttext, this.obscureText = false})
      : super(key: key);
  String? hinttext;
  TextInputType? inputType;
  Function(String)? onchanged;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText!,
      onChanged: onchanged,
      decoration: InputDecoration(
        hintText: hinttext,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
