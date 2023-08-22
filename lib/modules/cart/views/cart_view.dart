import 'package:flutter/material.dart';
import 'package:shop_app/modules/cart/views/components/cart_list.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        padding: EdgeInsets.all(24), child: CartList());
  }
}
