import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/modules/user/controllers/user_change_controller.dart';
import 'package:shop_app/modules/user/views/components/user_form.dart';
import 'package:shop_app/widgets/custom_primary_button.dart';

class UserAddView extends StatelessWidget {
  const UserAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add User'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const UserForm(),
              const SizedBox(height: 20),
              CustomPrimaryButton(
                onPressed: () {
                  Get.find<UserChangeController>().addUser();
                },
                text: "Add User",
              ),
            ],
          ),
        ));
  }
}
