import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  const MyText({super.key,required this.title,this.fontSize,this.fontWeight,this.color,this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),);
  }
}
