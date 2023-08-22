import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/styles/app_styles.dart';
import 'package:shop_app/data/models/cart/response/cart_response.dart';
import 'package:shop_app/modules/cart/controllers/cart_change_controller.dart';
import 'package:shop_app/modules/cart/controllers/cart_detail_controller.dart';

import 'package:shop_app/routes/app_route.dart';
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
