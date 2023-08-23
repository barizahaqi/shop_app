import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/styles/app_styles.dart';
import 'package:shop_app/data/models/cart/response/cart_response.dart';
import 'package:shop_app/modules/cart/controllers/cart_change_controller.dart';
import 'package:shop_app/modules/cart/controllers/cart_detail_controller.dart';
import 'package:shop_app/modules/product/controllers/product_controller.dart';
import 'package:shop_app/modules/user/controllers/user_controller.dart';

import 'package:shop_app/routes/app_route.dart';
import 'package:shop_app/utils/date_util.dart';
import 'package:shop_app/widgets/custom_primary_button.dart';

class CartDetailBody extends GetView<CartDetailController> {
  const CartDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => _buildCartDetail(context, state!),
      onLoading: const Center(child: LinearProgressIndicator()),
      onError: (error) => Center(child: Text(error!)),
    );
  }

  Widget _buildCartDetail(BuildContext context, CartResponse cart) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Id ${cart.id.toString()}",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        Text(
          "User: ${Get.find<UserController>().getNameById(cart.userId.toString())}",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 10),
        Text(
          "Date: ${DateUtil.getStringViewDate(cart.date)}",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 10),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var item in cart.products)
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
        const SizedBox(height: 20),
        CustomPrimaryButton(
            color: AppStyles.primaryColor,
            onPressed: () {
              Get.toNamed(AppRoute.editCart, arguments: cart);
            },
            text: "Edit Cart"),
        const SizedBox(height: 10),
        CustomPrimaryButton(
            color: Colors.red,
            onPressed: () {
              Get.find<CartChangeController>().deleteCart(cart.id.toString());
              Get.back();
            },
            text: "Delete Cart")
      ],
    );
  }
}
