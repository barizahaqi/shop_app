import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/modules/settings/controllers/settings_controller.dart';
import 'package:shop_app/widgets/custom_outlined_button.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your token is: ${controller.token.value}",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 20),
          CustomOutlinedButton(
              text: "Sign out",
              onPressed: () {
                controller.signOut();
              })
        ],
      ),
    );
  }
}
