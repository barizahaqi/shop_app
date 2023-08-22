import 'package:flutter/material.dart';
import 'package:shop_app/core/styles/app_styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: const BorderSide(color: AppStyles.primaryColor),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppStyles.primaryColor),
      ),
    );
  }
}
