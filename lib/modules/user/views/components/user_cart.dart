import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/modules/cart/controllers/cart_user_controller.dart';
import 'package:shop_app/modules/product/controllers/product_controller.dart';

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
              for (var item in state![0].products)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.circle, size: 10),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "${Get.find<ProductController>().getNameById(item.productId.toString())}: ",
                        style: Theme.of(context).textTheme.bodyLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${item.quantity} Item",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                )
            ],
          )),
      onLoading: const Center(child: LinearProgressIndicator()),
      onEmpty: const Center(child: Text("No cart for this user")),
      onError: (error) => Center(child: Text(error!)),
    );
  }
}
