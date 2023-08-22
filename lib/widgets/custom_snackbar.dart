import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar extends StatelessWidget {
  const CustomSnackbar({super.key, required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.amberAccent,
      colorText: Colors.black,
      icon: const Icon(Icons.alarm),
      shouldIconPulse: true,
      maxWidth: 400,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      borderRadius: 20,
      borderColor: Colors.black,
      borderWidth: 2,
      leftBarIndicatorColor: Colors.black,
      mainButton: TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text(
          'Retry',
          style: TextStyle(color: Colors.black),
        ),
      ),
      onTap: (val) {
        print('I pressed the SnackBar! Me too!');
      },
      barBlur: 20,
      overlayBlur: 20,
      isDismissible: true,
      dismissDirection: DismissDirection.up,
      forwardAnimationCurve: Curves.easeOutBack,
    ) as Widget;
  }
}
