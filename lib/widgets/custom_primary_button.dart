import 'package:flutter/material.dart';
import 'package:shop_app/core/styles/app_styles.dart';

class CustomPrimaryButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? height;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? textSize;
  final double? margin;
  final TextStyle? style;

  const CustomPrimaryButton({
    super.key,
    required this.onPressed,
    this.color = AppStyles.secondaryColor,
    this.margin,
    this.style,
    required this.text,
    this.height,
    this.borderRadius,
    this.horizontalPadding,
    this.textSize,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 52,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: color,
          elevation: 2,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 12)),
          ),
        ),
        onPressed: onPressed,
        child: Text(text,
            style: style ??
                Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: textColor ?? Colors.white,
                      fontSize: textSize ?? 16,
                    )),
      ),
    );
  }
}
