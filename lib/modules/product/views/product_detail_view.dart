import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/modules/product/controllers/product_detail_controller.dart';
import 'package:shop_app/modules/product/views/components/product_detail_body.dart';
import 'package:shop_app/core/constants/string_constant.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.id});

  final int id;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailController>().getDetailProduct(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(StringConstant.detailProductTitle),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: ProductDetailBody(),
        ));
  }
}
