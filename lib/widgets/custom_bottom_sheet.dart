import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget body;

  const CustomBottomSheet({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: Get.width,
      constraints: BoxConstraints(
        maxHeight: Get.height / 1.1,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: Get.width / 3,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 10, 24, 24),
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}

void showCustomBottomSheet({
  required Widget body,
  bool ignoreSafeArea = false,
}) {
  Get.bottomSheet(
    CustomBottomSheet(
      body: body,
    ),
    backgroundColor: Colors.transparent,
    ignoreSafeArea: ignoreSafeArea,
  );
}
