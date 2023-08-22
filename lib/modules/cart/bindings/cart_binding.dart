import 'package:get/get.dart';
import 'package:shop_app/modules/cart/bindings/cart_module.dart';
import 'package:shop_app/modules/cart/controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  dependencies() {
    initCartModule();

    // controller
    Get.lazyPut(() => CartController(cartRepository: Get.find()));
  }
}
