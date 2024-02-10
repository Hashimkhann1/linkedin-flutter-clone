import 'package:flutter/material.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
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
  final Border? border;
  final Alignment? alignment;
  final bool loading;
  final Color? loadingColor;
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
      this.onTap,
      this.border,
      this.loading = false,
      this.loadingColor});

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
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          border: border,
        ),
        child: loading ? CircularProgressIndicator(color: loadingColor,) : MyText(
          title: title,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}
