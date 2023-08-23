import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/data/repositories/login_repository.dart';
import 'package:shop_app/modules/user/controllers/user_controller.dart';
import 'package:shop_app/routes/app_route.dart';

class LoginController extends GetxController {
  LoginController({required this.loginRepository});
  final LoginRepository loginRepository;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async {
    if (formKey.currentState!.validate()) {
      final response =
          await loginRepository.login(username.text, password.text);
      response.fold((failed) => Get.snackbar("Failed to login", failed.message),
          (success) {
        GetStorage().write('isLoggedIn', true);
        GetStorage().write("token", success.token);
        Get.find<UserController>().saveId(username.text, password.text);
        Get.toNamed(AppRoute.main);
      });
    }
  }
}
