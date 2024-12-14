import 'package:flutter/material.dart';
import 'package:greenery/core/constants/colors.dart';
import 'package:greenery/screens/widgets/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.height,
    this.width,
    this.iconWidget,
    required this.onPressed,
    this.backgroundColor,
    required this.label,
    this.labelColor = Colors.black,
    this.labelSize = 18,
    this.borderRadius = 10,
    this.childWidget,
    this.labelFont,
  });

  final double? height;
  final double? width;
  final Widget? iconWidget;
  final void Function() onPressed;
  final Color? backgroundColor;
  final String label;
  final Color labelColor;
  final double labelSize;
  final double borderRadius;
  final Widget? childWidget;
  final FontWeight? labelFont;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? MediaQuery.of(context).size.height / 12,
      width: width ?? MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ??
                primaryColor, // Assign primaryColor if backgroundColor is null
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconWidget != null) iconWidget!,
              if (iconWidget != null) const SizedBox(width: 5),
              if (childWidget != null)
                childWidget!
              else
                CustomText(
                  text: label,
                  fontSize: labelSize,
                  fontColor: labelColor,
                  fontweight: labelFont ?? FontWeight.normal,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
