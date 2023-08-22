import 'package:flutter/material.dart';
import 'package:shop_app/modules/product/views/components/product_list.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        padding: EdgeInsets.all(24), child: ProductList());
  }
}
