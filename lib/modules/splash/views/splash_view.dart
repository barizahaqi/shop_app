import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/modules/splash/controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
            "https://img.freepik.com/premium-vector/blue-cart-online-shopping-logo_591497-166.jpg?w=740"),
      ),
    );
  }
}
