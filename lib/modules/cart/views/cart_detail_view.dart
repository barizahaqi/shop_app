import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/modules/cart/controllers/cart_detail_controller.dart';
import 'package:shop_app/modules/cart/views/components/cart_detail_body.dart';

class CartDetailScreen extends StatefulWidget {
  const CartDetailScreen({super.key, required this.id});

  final int id;

  @override
  State<CartDetailScreen> createState() => _CartDetailScreenState();
}

class _CartDetailScreenState extends State<CartDetailScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<CartDetailController>().getDetailCart(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(StringConstant.detailCartTitle),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: CartDetailBody(),
        ));
  }
}
