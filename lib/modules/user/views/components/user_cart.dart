import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/modules/cart/controllers/cart_user_controller.dart';

class UserCart extends GetView<CartUserController> {
  const UserCart({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("List Cart Item:",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              for (var item in state!.products)
                Text(
                    "Product Id : ${item.productId} x Jumlah: ${item.quantity}"),
            ],
          )),
      onLoading: const Center(child: CircularProgressIndicator()),
      onEmpty: const Center(child: Text(StringConstant.emptyUser)),
      onError: (error) => Center(child: Text(error!)),
    );
  }
}
