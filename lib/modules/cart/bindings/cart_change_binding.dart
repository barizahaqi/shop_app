import 'package:get/get.dart';
import 'package:shop_app/modules/cart/bindings/cart_module.dart';
import 'package:shop_app/modules/cart/controllers/cart_change_controller.dart';

class CartChangeBinding extends Bindings {
  @override
  dependencies() {
    initCartModule();

    // controller
    Get.lazyPut(() => CartChangeController(cartRepository: Get.find()),
        fenix: true);
  }
}
