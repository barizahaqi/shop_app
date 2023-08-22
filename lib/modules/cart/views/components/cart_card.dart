import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/data/models/cart/response/cart_response.dart';
import 'package:shop_app/modules/cart/controllers/cart_controller.dart';
import 'package:shop_app/routes/app_route.dart';
import 'package:shop_app/core/styles/app_styles.dart';

class CartCard extends GetView<CartController> {
  final CartResponse cart;

  const CartCard({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      shadowColor: Colors.grey.withOpacity(0.5),
      color: AppStyles.secondaryColor,
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoute.detailCart, arguments: cart.id);
        },
        child: ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: Text("Cart Id: ${cart.id}",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    )),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text("Date : ${DateFormat('dd MMM yyyy').format(cart.date)}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        )),
                Text(
                    "Product Count: ${cart.products.map((e) => e.quantity).reduce((value, element) => value + element)}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        )),
              ],
            )),
      ),
    );
  }
}
