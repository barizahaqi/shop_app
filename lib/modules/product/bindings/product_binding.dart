import 'package:get/get.dart';
import 'package:shop_app/modules/product/bindings/product_module.dart';
import 'package:shop_app/modules/product/controllers/product_categories_controller.dart';
import 'package:shop_app/modules/product/controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  dependencies() {
    initProductModule();

    // controller
    Get.lazyPut(() => ProductController(productRepository: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => ProductCategoriesController(productRepository: Get.find()),
        fenix: true);
  }
}
