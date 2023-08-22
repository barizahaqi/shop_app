import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/models/product/response/product_response.dart';
import 'package:shop_app/routes/app_route.dart';
import 'package:shop_app/core/styles/app_styles.dart';

class ProductCard extends StatelessWidget {
  final ProductResponse product;

  const ProductCard({super.key, required this.product});

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
          Get.toNamed(AppRoute.detailProduct, arguments: product.id);
        },
        child: Column(
          children: [
            Image.network(
              product.image,
              width: double.infinity,
              height: 180,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    product.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    "\$${product.price.toString()}",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 15,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        '${product.rating.rate} | ${product.rating.count} people',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
