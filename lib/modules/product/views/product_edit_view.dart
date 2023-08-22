import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/models/product/response/product_response.dart';
import 'package:shop_app/modules/product/controllers/product_change_controller.dart';
import 'package:shop_app/modules/product/views/components/product_form.dart';
import 'package:shop_app/widgets/custom_primary_button.dart';

class ProductEditView extends StatefulWidget {
  const ProductEditView({
    super.key,
    required this.product,
  });
  final ProductResponse product;

  @override
  State<ProductEditView> createState() => _ProductEditViewState();
}

class _ProductEditViewState extends State<ProductEditView> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductChangeController>().initForm(
        widget.product.title,
        widget.product.price.toString(),
        widget.product.description,
        widget.product.image,
        widget.product.category);
  }

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
                  Get.find<ProductChangeController>()
                      .updateProduct(widget.product.id.toString());
                },
                text: "Edit Product",
              ),
            ],
          ),
        ));
  }
}
