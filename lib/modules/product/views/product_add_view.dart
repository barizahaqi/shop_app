import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/modules/product/controllers/product_change_controller.dart';
import 'package:shop_app/modules/product/views/components/product_form.dart';
import 'package:shop_app/widgets/custom_primary_button.dart';

class ProductAddView extends StatelessWidget {
  const ProductAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const ProductForm(),
              const SizedBox(height: 20),
              CustomPrimaryButton(
                onPressed: () {
                  Get.find<ProductChangeController>().addProduct();
                },
                text: "Add Product",
              ),
            ],
          ),
        ));
  }
}
