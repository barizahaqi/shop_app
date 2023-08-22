import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/modules/login/controller/login_controller.dart';
import 'package:shop_app/modules/login/views/component/login_form.dart';
import 'package:shop_app/widgets/custom_primary_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login", style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 20),
            const LoginForm(),
            const SizedBox(height: 20),
            CustomPrimaryButton(
              onPressed: () {
                Get.find<LoginController>().login();
              },
              text: "Login",
            ),
          ],
        ),
      ),
    ));
  }
}
