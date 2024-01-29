import 'package:flutter/material.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? hintTextColor;
  final TextEditingController? controller;
  final BorderSide enabledBorderSide;
  final BorderSide focusBorderSide;

  MyTextFormField(
      {super.key,
      required this.hintText,
      this.fontSize,
      this.fontWeight,
      this.hintTextColor,
      required this.controller,
      this.enabledBorderSide = const BorderSide(color: Colors.grey),
      this.focusBorderSide = const BorderSide(color: Color(0xff0c63bf),width: 2)});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: hintTextColor,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: enabledBorderSide),
        focusedBorder: OutlineInputBorder(
            borderSide: focusBorderSide
        ),
      ),
    );
  }
}
