import 'package:flutter/material.dart';
import 'package:linkedinclone/res/widgets/my_text_widget.dart';

class MyTextButton extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Alignment? alignment;
  final void Function()? onTap;

    MyTextButton(
      {super.key,
      required this.title,
      this.backgroundColor,
      this.fontSize,
      this.fontWeight,
      this.textColor,
      this.width,
      this.height,
      this.borderRadius,
      this.alignment,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: alignment,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius ?? BorderRadius.circular(12)
        ),
        child: MyText(
          title: title,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}
