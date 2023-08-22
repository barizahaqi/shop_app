import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/modules/product/controllers/product_controller.dart';
import 'package:shop_app/modules/product/views/components/product_card.dart';
import 'package:shop_app/core/constants/string_constant.dart';

class ProductList extends GetView<ProductController> {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: state!.length,
        itemBuilder: (context, index) => ProductCard(product: state[index]),
      ),
      onLoading: const Center(child: CircularProgressIndicator()),
      onEmpty: const Center(child: Text(StringConstant.emptyProduct)),
      onError: (error) => Center(child: Text(error!)),
    );
  }
}
