import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop_app/modules/cart/controllers/cart_change_controller.dart';

class CartForm extends GetView<CartChangeController> {
  const CartForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}
