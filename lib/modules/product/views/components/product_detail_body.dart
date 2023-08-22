import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/styles/app_styles.dart';
import 'package:shop_app/modules/product/controllers/product_change_controller.dart';
import 'package:shop_app/modules/product/controllers/product_detail_controller.dart';
import 'package:shop_app/data/models/product/response/product_response.dart';
import 'package:shop_app/routes/app_route.dart';
import 'package:shop_app/widgets/custom_primary_button.dart';

class ProductDetailBody extends GetView<ProductDetailController> {
  const ProductDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => _buildProductDetail(context, state!),
      onLoading: const Center(child: LinearProgressIndicator()),
      onError: (error) => Center(child: Text(error!)),
    );
  }

  Widget _buildProductDetail(BuildContext context, ProductResponse product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            height: 300,
            child: Image.network(product.image),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          product.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        Text(
          product.description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 10),
        Text(
          "Category: ${product.category}",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 10),
        Text(
          "Price: \$${product.price.toString()}",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 10),
        Text(
          "Rating: ${product.rating.rate.toString()}",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 10),
        Text(
          "Rating Count: ${product.rating.count.toString()}",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        CustomPrimaryButton(
            color: AppStyles.primaryColor,
            onPressed: () {
              Get.toNamed(AppRoute.editProduct, arguments: product);
            },
            text: "Edit Product"),
        const SizedBox(height: 20),
        CustomPrimaryButton(
            color: Colors.red,
            onPressed: () {
              Get.find<ProductChangeController>()
                  .deleteProduct(product.id.toString());
              Get.back();
            },
            text: "Delete Product")
      ],
    );
  }
}
