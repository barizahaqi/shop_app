import 'package:get/get.dart';
import 'package:shop_app/modules/product/bindings/product_module.dart';
import 'package:shop_app/modules/product/controllers/product_change_controller.dart';
import 'package:shop_app/modules/product/controllers/product_detail_controller.dart';

class ProductDetailBinding extends Bindings {
  @override
  dependencies() {
    initProductModule();

    // controller
    Get.lazyPut(() => ProductDetailController(productRepository: Get.find()));
    Get.lazyPut(() => ProductChangeController(productRepository: Get.find()),
        fenix: true);
  }
}
