import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/modules/cart/controllers/cart_controller.dart';
import 'package:shop_app/modules/cart/views/components/cart_card.dart';

class CartList extends GetView<CartController> {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state!.length,
        itemBuilder: (context, index) => CartCard(cart: state[index]),
      ),
      onLoading: const Center(child: CircularProgressIndicator()),
      onEmpty: const Center(child: Text(StringConstant.emptyCart)),
      onError: (error) => Center(child: Text(error!)),
    );
  }
}
