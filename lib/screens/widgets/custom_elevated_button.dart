import 'package:flutter/material.dart';
import 'package:greenery/screens/widgets/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.height,
    required this.width,
    this.iconWidget,
    required this.onPressed,
    required this.backgroundColor,
    required this.label,
    required this.labelColor,
    required this.labelSize,
    this.borderRadius = 10,
    this.childWidget, this.border,
  });
  final double height;
  final double width;
  final Widget? iconWidget;
  final void Function() onPressed;
  final Color backgroundColor;
  final String label;
  final Color labelColor;
  final double labelSize;
  final double borderRadius;
  final Widget? childWidget;
  final Border? border;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
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
                  fontweight: FontWeight.w600,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
