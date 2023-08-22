import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/modules/login/controller/login_controller.dart';
import 'package:shop_app/widgets/custom_outlined_text_field.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomOutlinedTextField(
            controller: controller.username,
            labelText: "Username",
            hintText: "Username",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstant.validationEmpty;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomOutlinedTextField(
            controller: controller.password,
            labelText: "Password",
            hintText: "Password",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstant.validationEmpty;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
