import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    this.fontFamily = 'Figtree',
    required this.fontSize,
    this.fontColor = null,
    this.fontweight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.underline = false,
    this.height = 1.5,
    this.maxLines = 100,
    this.textOverflow = TextOverflow.visible,
    this.fontStyle,
  });

  final String text;
  final String fontFamily;
  final double fontSize;
  Color? fontColor;
  final FontWeight fontweight;
  final TextAlign textAlign;
  final bool underline;
  final double height;
  final int maxLines;
  final TextOverflow textOverflow;
  FontStyle? fontStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontweight,
        fontStyle: fontStyle,
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
        // decorationColor: mainAppThemeColor,
        height: height,
      ),
      maxLines: maxLines,
      overflow: textOverflow,
      textAlign: textAlign,
    );
  }
}
