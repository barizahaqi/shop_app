import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/models/cart/response/cart_response.dart';
import 'package:shop_app/modules/cart/controllers/cart_change_controller.dart';
import 'package:shop_app/modules/cart/views/components/cart_form.dart';
import 'package:shop_app/widgets/custom_primary_button.dart';

class CartEditView extends StatefulWidget {
  const CartEditView({
    super.key,
    required this.cart,
  });
  final CartResponse cart;

  @override
  State<CartEditView> createState() => _CartEditViewState();
}

class _CartEditViewState extends State<CartEditView> {
  @override
  void initState() {
    super.initState();
    Get.find<CartChangeController>()
        .initForm(widget.cart.products, widget.cart.date);
  }

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
                  Get.find<CartChangeController>()
                      .updateCart(widget.cart.id.toString(), "1");
                },
                text: "Edit Cart",
              ),
            ],
          ),
        ));
  }
}
