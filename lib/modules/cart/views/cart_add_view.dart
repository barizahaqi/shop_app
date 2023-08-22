import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/modules/cart/controllers/cart_change_controller.dart';
import 'package:shop_app/modules/cart/views/components/cart_form.dart';
import 'package:shop_app/widgets/custom_primary_button.dart';

class CartAddView extends StatelessWidget {
  const CartAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Cart'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const CartForm(),
              const SizedBox(height: 20),
              CustomPrimaryButton(
                onPressed: () {
                  Get.find<CartChangeController>().addCart("1");
                },
                text: "Add Cart",
              ),
            ],
          ),
        ));
  }
}
